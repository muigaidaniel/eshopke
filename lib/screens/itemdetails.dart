import 'package:eshopke/components/items.dart';
import 'package:eshopke/components/appbar.dart';
import 'package:flutter/material.dart';

class Itemdetails extends StatefulWidget {
  final Item item;

  const Itemdetails({Key key, this.item}) : super(key: key);
  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNav(
        title: Text('E-SHOP KE'),
        appBar: AppBar(),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){Navigator.pushNamed(context, '/cart');})]),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 300.0,
              color: Colors.black,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.item.itempicture),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(widget.item.itemname),
                    title: Text("Ksh ${widget.item.itemprice}",textAlign: TextAlign.right,),
                  ),
                ),
              ),
            ),
            Text('Loren ipsum'),
            RaisedButton(
                child: Row(
                  children: [
                    Text('Add to cart'),
                    Icon(Icons.shopping_cart)
                  ],),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                      content: Text('Item added to cart!')));
                }),
          ],
        ),
      ),
    );
  }
}
