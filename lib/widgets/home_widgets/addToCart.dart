// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog)? true:false;
    return ElevatedButton(
      onPressed:() async {
        if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);
          // setState(() {});
          await Future.delayed(Duration(seconds:1));
          await Navigator.pushNamed(context, MyRoutes.bookRoute);
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Already Added".text.make()));
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.redAccent), 
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart? Icon(Icons.done):"Book".text.make());
  }
}
