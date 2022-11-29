// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/widgets/theme.dart';

import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{ 
    final catalogJson = 
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyTheme.creamecolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if(CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else  
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      )
    );
  }
}


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

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (BuildContext context, int index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.make().p12(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Rs.${catalog.price}".text.bold.lg.make(),
                    ElevatedButton(
                      onPressed: (() {
                      }), 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent), 
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ),
                      child: "Book".text.make()),
                  ],
                )
              ],
            )
            )
        ],
      )
    ).blue100.rounded.square(150).make().py20();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image
          ).box.rounded.p8.color(Color.fromARGB(255, 239, 239, 243)).make().p8().w40(context);
  }
}
