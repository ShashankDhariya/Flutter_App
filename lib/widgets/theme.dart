import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: darkBlueish,
        canvasColor: Colors.white,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black,),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.1,
            fontWeight: FontWeight.w500,
          ),
        )
      );

      static ThemeData darkTheme(BuildContext context) => ThemeData(
        cardColor: Colors.deepOrange,
        canvasColor: darkCreame,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black,),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.1,
            fontWeight: FontWeight.w500,
          ),
        )

      );

      static Color creamecolor = Color.fromRGBO(245, 245, 245, 1);
      static Color darkCreame = Vx.gray900;
      static Color darkBlueish = Color.fromARGB(196, 12, 20, 94);
      static Color lightBlueish = Vx.purple400;
}