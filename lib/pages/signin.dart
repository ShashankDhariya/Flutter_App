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
        child: Material(
          color: context.canvasColor,
          child: SingleChildScrollView(
            child: Form(
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
                  
                  "Welcome".text.make(),
                  
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
                              return "Enter your Email id";
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
                          onPressed: () {
                              if(email == '2011' && pass == '123456'){
                                Navigator.pushNamed(context, MyRoutes.homeRoute);
                              }
                              else if(pass != '123456' && email != '2011'){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Invalid Credentials".text.make()));
                              }
                              else if(email == '2011' && pass != '123456'){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Invalid Password".text.make()));
                              }
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Invalid Username".text.make()));
                              }
                          }, 
                          child: "Sign in".text.make())
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