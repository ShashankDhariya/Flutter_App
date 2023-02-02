import 'package:first_app/core/store.dart';
import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog)? true:false;
    return ElevatedButton(
      onPressed:() {
        if(count(catalog.rooms.toInt())){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "No rooms available".text.make()));
        }
        else if(!isInCart){
          AddMutation(catalog);
          Navigator.pushNamed(context, MyRoutes.bookRoute);
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Already Added".text.make()));
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.redAccent), 
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart? Icon(Icons.done):"Book".text.make());
  }
  
  bool count(num rooms) {
    return rooms == 0;
  }
}
