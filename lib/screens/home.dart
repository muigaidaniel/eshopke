import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/categories.dart';
import 'package:eshopke/components/container_labels.dart';
import 'package:eshopke/components/items.dart';
import 'package:eshopke/components/favourites.dart';
import 'package:eshopke/components/navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String label;
  HomeScreen({this.label});
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
          Label(label: 'Categories'),
          Categories(),
          Label(label: 'Items'),
          Items(),
          Label(label: 'Favourites'),
          Favourites(),
        ],
      ) ,
    );
  }
}
