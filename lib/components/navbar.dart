
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Daniel'),
              accountEmail: Text('muigaidaniel81@gmail.com'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person),)),
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
              onTap: (){},
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
    );
  }
}
