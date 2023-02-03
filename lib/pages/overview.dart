import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: 
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset("assets/images/geu.png", fit: BoxFit.cover ,),
                  270.heightBox,
                  "Book Your Hostel".text.bold.italic.xl4.blue100.make(),
                  10.heightBox,
                  "Graphic Era".text.xl2.underline.italic.red300.make(),
                  20.heightBox,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.cardColor, // Background color
                    ),
                    onPressed:() => Navigator.pushNamed(context, MyRoutes.loginRoute),
                    child: "Login".text.white.xl2.make(),
                  ),
                  200.heightBox,
                  "Don't have account?".text.white.make(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.canvasColor, // Background color
                    ),
                    onPressed:() => Navigator.pushNamed(context, MyRoutes.signinRoute),
                    child: "Sign up".text.bold.underline.xl.make(),
                  ).objectBottomCenter()
                ],
            ),
          ),
    );
  }
}