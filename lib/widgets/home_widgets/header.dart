import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/theme.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Graphic Era Hostel".text.xl3.bold.color(MyTheme.darkBlueish).make(),
              "Transforming Dreams into Reality".text.make(),
            ],
          );
  }
}
