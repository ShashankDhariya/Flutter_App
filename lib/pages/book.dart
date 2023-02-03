import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookHostel extends StatelessWidget {
  const BookHostel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: "Book your Room".text.bold.xl2.make(),
      ),
      body: Column(
        children: [
          HostelPay().p32().expand(),
          const Divider(),
          const _Total(),
        ],
      ),
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({super.key});
  
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Rs. ${_cart.tatalPrice}".text.xl.color(context.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed:() {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Not Supported yet".text.color(context.primaryColor).make()));
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.cardColor,
              ),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              )
            ),
            child: "Pay".text.xl2.make(),
            ).w24(context).py24()
        ],
      ).p16(),
    );
  }
}

class HostelPay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
      ? "Nothing to show".text.xl.color(context.primaryColor).make().centered()
      : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder:(context, index) => ListTile(
        leading: Icon(
          Icons.done,
          color: context.primaryColor,
          ),
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: context.primaryColor,
            ),
          onPressed:() => RemoveMutation(_cart.items[index]),
          ),
          title: _cart.items[index].name.text.color(context.primaryColor).make(),
          subtitle: _cart.items[index].rooms.text.make(),
      ),
    );
  }
}