import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  
  @override
  Widget build(BuildContext context) {
    String email = '';
    String pass = '';
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black26,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed:() => Navigator.pushNamed(context, MyRoutes.loginRoute),
                    backgroundColor: context.canvasColor,
                    child: const Icon(CupertinoIcons.back),
                    ).objectTopLeft(),

                  50.heightBox,
                  Image.asset("assets/images/Register.png" ,width: 250),
                  
                  20.heightBox,
                  
                  "Welcome".text.make(),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 30.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white38),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: TextFormField(
                            onChanged:(value) {
                              email = value;
                            },
                            style: TextStyle(color: context.primaryColor),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: context.primaryColor
                              ),
                            ),
                          ),
                        ),
                  
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white38),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: TextFormField(
                            onChanged:(value) {
                              pass = value;
                            },
                            style: TextStyle(color: context.primaryColor),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: context.primaryColor
                              ),
                            ),
                          ),
                        ),
                  
                        15.heightBox,
            
                        ElevatedButton(
                          onPressed: () async {
                              showDialog(
                                context: context, 
                                builder: (context){
                                  return const Center(child: CircularProgressIndicator());
                                }
                              );
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email,
                                password: pass,
                              );
                                Navigator.pushNamed(context, MyRoutes.loginRoute);
                                } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "The password provided is too weak".text.make()));
                              } else if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "The account already exists for that email".text.make()));
                              }
                              else if(email.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Email can't be empty".text.make()));
                              }
                              else if(pass.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Password can't be empty".text.make()));
                              }
                              } catch (e) {
                              print(e);
                            }
                          }, 
                          child: "Sign up".text.make()),
                          100.heightBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}