import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/cart_items.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNav(title: Text('Cart'),appBar: AppBar(),),
      body: Column(
        children: [
          Container( height: MediaQuery.of(context).size.height*0.75,child: CartItems()),
          Container(
            margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Expanded(child: Text('Total: Ksh 1,000')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(onPressed: (){},child: Text('Checkout'),),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
