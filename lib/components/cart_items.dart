import 'package:flutter/material.dart';
import 'package:eshopke/data/itemlist.dart';

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item_list.length,
      itemBuilder: (context,index){
        return CartItem(
          cart_itemname: item_list[index]['Name'],
          cart_itempicture: item_list[index]['Picture'],
          cart_itemprice: item_list[index]['Price'],
        );
      });
  }
}

class CartItem extends StatelessWidget {
  final cart_itemname;
  final cart_itempicture;
  final cart_itemprice;
  CartItem({this.cart_itemname,this.cart_itempicture,this.cart_itemprice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_itempicture,width: 80,),
        title: Text(cart_itemname),
        subtitle: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('Number:')),
                Expanded(child: Text('Cost:')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

