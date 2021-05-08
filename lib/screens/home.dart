import 'package:eshopke/business_logic/user_provider.dart';
import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/categories.dart';
import 'package:eshopke/components/container_labels.dart';
import 'package:eshopke/components/items.dart';
import 'package:eshopke/components/favourites.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  String label;
  HomeScreen({this.label});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;

  initUser()async{
    _user= await _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context);
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("user.user.displayName"),
              accountEmail: Text("user.user.email"),
              //currentAccountPicture: Image.network("user.user.photoURL")
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home)
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite)
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('Orders'),
                    leading: Icon(Icons.shopping_bag)
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('My account'),
                    leading: Icon(Icons.person)
                )
            ),
            InkWell(
                onTap: (){
                  user.signOut();
                },
                child: ListTile(
                    title: Text('Log out'),
                    leading: Icon(Icons.logout)
                )
            ),
            Divider(),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings)
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                    title: Text('Help'),
                    leading: Icon(Icons.help)
                )
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Label(label: 'Categories'),
          Categories(),
          Label(label: 'Items'),
          Items(),
         // Label(label: 'Favourites'),
         // Favourites(),
        ],
      ) ,
    );
  }
}
