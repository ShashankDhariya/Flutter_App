import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String pass = '';
  bool changeButton = false;

  @override
  Widget build(BuildContext  context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.heightBox,
              Image.asset("assets/images/Register.png", width: 200,),
              20.heightBox,
              
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
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email,
                              password: pass
                              );
                              Navigator.pushNamed(context, MyRoutes.homeRoute);
                            } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "No user found for that email".text.make()));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Wrong password provided for that user".text.make()));
                            }
                            else if(email.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Email can't be empty".text.make()));
                            }
                            else if(pass.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Password can't be empty".text.make()));
                            }
                        }
                        }, 
                        child: "Login".text.make(),
                        ),

                        30.heightBox,
                        "Don't have account?".text.white.make(),
      
                        TextButton(
                          onPressed:() {
                            Navigator.pushNamed(context, MyRoutes.signinRoute);
                          },
                          child: "Sign up".text.white.underline.make(),),
                          100.heightBox,
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}