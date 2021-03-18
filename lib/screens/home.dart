import 'package:eshopke/components/categories.dart';
import 'package:eshopke/components/items.dart';
import 'package:eshopke/components/navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-SHOP KE'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
        ],
      ),
      drawer: Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          Categories(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Items'),
          ),
          Container(height: 390.0,child: Items()),
        ],
      ) ,
    );
  }
}
