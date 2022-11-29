import 'package:first_app/models/catalog.dart';
import 'package:first_app/pages/home_details.dart';
import 'package:first_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (BuildContext context, int index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(catalog: catalog))),
          child: CatalogItem(catalog: catalog));
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
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

