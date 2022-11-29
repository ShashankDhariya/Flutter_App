import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
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
        brightness: Brightness.dark,
      );

      static Color creamecolor = Color.fromARGB(255, 212, 199, 199);
      static Color darkBlueish = Color.fromARGB(196, 12, 20, 94);
}