import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/categories.dart';
import 'package:eshopke/components/items.dart';
import 'package:eshopke/components/favourites.dart';
import 'package:eshopke/components/navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNav(
        title: Text('E-SHOP KE'),
        appBar: AppBar(),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){}),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
          Navigator.of(context).pushNamed('/cart');
        }),
      ],),
      drawer: Navbar(),
      body: ListView(
        children: [
          Container(padding: const EdgeInsets.all(8.0), child: Text('Categories')),
          Categories(),
          Container(padding: const EdgeInsets.all(8.0), child: Text('Items'),),
          Container(height: MediaQuery.of(context).size.height*0.6,child: Items()),
          Container(padding: const EdgeInsets.all(8.0), child: Text('Favourites')),
          Container(height: MediaQuery.of(context).size.height*0.6,child: Favourites())
        ],
      ) ,
    );
  }
}
