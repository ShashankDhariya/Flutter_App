import 'dart:convert';
import 'package:first_app/widgets/home_widgets/catalog_list.dart';
import 'package:first_app/widgets/home_widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../utils/routes.dart';
import '../widgets/theme.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.pushNamed(context, MyRoutes.bookRoute),
        child: Icon(CupertinoIcons.viewfinder_circle_fill),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Vx.m20,
            child: 
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                if(CatalogModel.items.isNotEmpty)
                  CatalogList().expand().py12()
                else  
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
      )
    );
  }
}