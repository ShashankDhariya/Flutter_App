import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/catalog.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "Rs.${catalog.price}".text.bold.xl2.make(),
          ElevatedButton(
          onPressed: (() {
          }), 
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.redAccent), 
          shape: MaterialStateProperty.all(StadiumBorder())
          ),
          child: "Book".text.xl.make()),
        ],
      ).p12().color(Colors.greenAccent),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
              ).p2(),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.xl3.bold.make().p12(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    ],
                  ),
                )
                )
          ],
        ),
      )
    );
  }
}
