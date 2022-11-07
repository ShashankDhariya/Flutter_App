import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext  context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
      
            Image.asset("assets/images/login.png",
            fit: BoxFit.cover ,
            ),
      
            SizedBox(
              height: 20.0, 
            ),
            
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 30.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
      
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
      
                  SizedBox(
                    height: 15,
                  ),

                  InkWell(
                    onTap: () async{
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute); 
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton? 70:120,
                      height: 40,
                      alignment: Alignment.center,
                      child: changeButton? 
                        Icon(
                          Icons.done, 
                          color: Colors.white,
                          )
                        : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                  //   child: Text("Login"),
                  //   )
                    
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}