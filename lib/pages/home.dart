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
    final catalogJson = 
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModels.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModels.items.isNotEmpty)?
        ListView.builder(
          itemCount: CatalogModels.items.length,
          itemBuilder: (context, index) =>
            ItemWidget(
              item: CatalogModels.items[index],
            ),
        ): const Center(
            child: CircularProgressIndicator(),
        )
      ),
      drawer: const MyDrawer(),
    );
  }
}
