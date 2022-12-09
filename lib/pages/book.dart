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
          Divider(),
          _Total(),
        ],
      ),
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({super.key});
  
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
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

class HostelPay extends StatefulWidget {
  const HostelPay({super.key});

  @override
  State<HostelPay> createState() => _HostelPayState();
}

class _HostelPayState extends State<HostelPay> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.xl.color(context.primaryColor).make().centered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder:(context, index) => ListTile(
        leading: Icon(
          Icons.done,
          color: context.primaryColor,
          ),
        trailing: IconButton(
          onPressed:() {
            _cart.remove(_cart.items[index]);
            
            setState(() {});
          }, 
          icon: Icon(
            Icons.remove_circle,
            color: context.primaryColor,
            ),
          ),
          title: _cart.items[index].name.text.color(context.primaryColor).make(),
      ),
      );
  }
}