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
                children: [
                  Image.asset("assets/images/geu.png", fit: BoxFit.cover ,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.canvasColor, // Background color
                    ),
                    onPressed:() => Navigator.pushNamed(context, MyRoutes.loginRoute),
                    child: "".text.white.make(),
                  ).objectTopRight(),
                  90.heightBox,
                  "Book Your Hostel".text.italic.xl4.white.make(),
                  "Graphic Era".text.xl2.underline.red300.make(),
                  150.heightBox,          
                  "Don't have account?".text.white.make(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.canvasColor, // Background color
                    ),
                    onPressed:() => Navigator.pushNamed(context, MyRoutes.signinRoute),
                    child: "Sign in".text.bold.underline.xl.make(),
                  ).objectBottomCenter()
                ],
            ),
          ),
    );
  }
}