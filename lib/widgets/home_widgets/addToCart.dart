import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog)? true:false;
    return ElevatedButton(
      onPressed:() async {
        if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {
          });
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