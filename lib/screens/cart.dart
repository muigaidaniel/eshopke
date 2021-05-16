import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/cart_items.dart';
import 'package:eshopke/database/cart_item.dart';
import 'package:eshopke/database/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState() {
    CartItemNotifier cartItemNotifier= Provider.of<CartItemNotifier>(context,listen: false);
    getCartItems(cartItemNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartItemNotifier cartItemNotifier= Provider.of<CartItemNotifier>(context);
    return Scaffold(
      appBar: AppBarNav(title: Text('Cart'),appBar: AppBar(),),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Image.asset('assets/items/${cartItemNotifier.cart_item_list[index].itemname}.jpg'),
                    title: Text(cartItemNotifier.cart_item_list[index].itemname,textAlign: TextAlign.left,),
                    subtitle: Text("Ksh ${cartItemNotifier.cart_item_list[index].price}",textAlign: TextAlign.right,),
                    );


                },
                itemCount: cartItemNotifier.cart_item_list.length),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(child: Text('Total: Ksh 0',style: TextStyle(color: Colors.white),)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  CollectionReference users= FirebaseFirestore.instance.collection('orders');
                  final firestoreInstance = FirebaseFirestore.instance;

                  firestoreInstance.collection("cart").add(
                      {
                        "name" : cartItemNotifier.currentItem.itemname,
                        "price" : cartItemNotifier.currentItem.price,
                        "quantity" : "1",
                      });
                },
                child: Text('Checkout'),),
            ),
          ],
        ),
      ),
      );
  }
}
