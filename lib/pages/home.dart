import 'package:first_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../widgets/item_widget.dart';

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
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final productData = decodeData("products");
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModels.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
        }),
      ),
      drawer: const MyDrawer(),
      
    );
  }
}
