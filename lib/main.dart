import 'package:first_app/core/store.dart';
import 'package:first_app/pages/book.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main(List<String> args) {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.bookRoute: (context) => BookHostel(),
      },
    );
  }
}