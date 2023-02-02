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
  String name = "";
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
    return SafeArea(
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
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                
                      TextFormField(
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
          
                      Material(
                        color: Colors.deepPurple ,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton? 70:120,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton? 
                              const Icon(
                                Icons.done, 
                                color: Colors.white,
                                )
                              : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}