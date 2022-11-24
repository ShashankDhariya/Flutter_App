import 'package:first_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
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
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,

            ),
          itemBuilder: ((context, index) {
            final item = CatalogModels.items[index];
            return Card(
              // clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: GridTile(
                header: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                  ),
                  child: Text(item.name),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text("Rs.${item.price.toString()}"),
                ),
                child: Image.network(item.image),
              ),
            );
          }),
          itemCount: CatalogModels.items.length,
        )
      : const Center(
            child: CircularProgressIndicator(),
        )
      ),
      drawer: const MyDrawer(),
    );
  }
}
