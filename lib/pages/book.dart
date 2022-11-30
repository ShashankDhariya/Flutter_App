import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookHostel extends StatelessWidget {
  const BookHostel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: "Book your Room".text.bold.xl2.make(),
      ),
    );
  }
}