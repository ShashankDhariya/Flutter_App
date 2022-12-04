import 'package:first_app/pages/book.dart';
import 'package:first_app/widgets/home_widgets/pics.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/catalog.dart';
import '../utils/routes.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Hostel Details...".text.make(),
        backgroundColor: context.canvasColor,
        iconTheme: IconThemeData(
          color: context.primaryColor,
        ),
      ),
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
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, MyRoutes.bookRoute),
            child: "Book".text.xl.make())
            ),
        ],
      ).p8().color(Colors.greenAccent),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
              ),
              Expanded(
                child: Container(
                  color: context.canvasColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        catalog.name.text.color(context.cardColor).xl4.bold.make().centered().p12(),
                        catalog.desc.text.lg.color(context.primaryColor).textStyle(context.captionStyle).make().centered(),
                        "Graphic Era Hostel located in the foothils of himalayas in Dehradun".text.color(context.primaryColor).center.make().py32().px12(),
                        "Facilities: ".text.color(context.primaryColor).xl3.bold.make().p12(),
                        10.heightBox,
                        "24x7 Electricity and Water.".text.xl.color(context.primaryColor).align(TextAlign.left).make().p16(),
                        "High Speed Internet.".text.xl.color(context.primaryColor).align(TextAlign.left).make().p16(),
                        HostelPhoto(),
                      ],
                    ),
                  ),
                )
                )
          ],
        ),
      )
    );
  }
}
