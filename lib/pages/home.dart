import 'package:first_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 10;
    String name = "Shashank Dhariya";

    return Scaffold(
      appBar: AppBar(
        title: Text("FirstApp"),
      ),      
      body: Center(
        child: Text("Hello Buddy, I'm trying learn Flutter in $days days ~ $name"),
      ),      
      drawer: MyDrawer(),
      
    );
  }
}
