import 'package:first_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TextButton(
                  //   onPressed:(){},
                  //   child: const Icon(CupertinoIcons.chat_bubble_2)
                  // ),

                  TextButton(
                    onPressed:(){
                      Navigator.pop(context);
                    },
                    child: "Signout".text.white.make(),
                  ),
                ],
              ),
              "Graphic Era Hostel".text.xl3.bold.color(context.cardColor).make(),
              "Transforming Dreams into Reality".text.color(context.primaryColor).make(),
            ],
          );
  }
}
