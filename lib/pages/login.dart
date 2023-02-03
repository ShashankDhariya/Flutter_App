import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
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
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute); 
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext  context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
          color: context.canvasColor,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
              
                    FloatingActionButton(
                      onPressed:() => Navigator.pushNamed(context, MyRoutes.overviewRoute),
                      child: Icon(CupertinoIcons.back),
                      backgroundColor: context.canvasColor,
                      ).objectTopLeft(),
                  Image.asset("assets/images/login.png",
                  fit: BoxFit.cover ,
                  ),
                  
                  20.heightBox,
                  
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: context.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged:(value) {
                              email = value;
                            },
                          style: TextStyle(color: context.primaryColor),
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                              color: context.primaryColor
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: context.primaryColor
                              )
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),
                  
                        TextFormField(
                          onChanged:(value) {
                              pass = value;
                            },
                          style: TextStyle(color: context.primaryColor),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              color: context.primaryColor
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: context.primaryColor
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password cannot be empty";
                            }
                            if(value.length < 6){
                              return "Password length should be more than 6";
                            }
                            return null;
                          },
                        ),
                  
                        15.heightBox,
            
                        ElevatedButton(
                            onPressed: () async {
                                try {
                                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: pass
                                  );
                                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                                } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                            }, 
                            child: "Login".text.make())
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