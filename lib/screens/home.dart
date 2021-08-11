import 'package:eshopke/business_logic/user_provider.dart';
import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/components/categories.dart';
import 'package:eshopke/components/container_labels.dart';
import 'package:eshopke/data/itemlist.dart';
import 'package:eshopke/screens/itemdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  String label;
  HomeScreen({this.label});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;

  initUser() async {
    _user = await _auth.currentUser;
  }

  @override
  void initState() {
    ItemNotifier itemNotifier =
        Provider.of<ItemNotifier>(context, listen: false);
    getItems(itemNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    return Scaffold(
      appBar: AppBarNav(
        title: Text('E-SHOP KE'),
        appBar: AppBar(),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              }),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("user.user.uid"),
              accountEmail: Text("user.user.email"),
              //currentAccountPicture: Image.network("user.user.photoURL")
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'homepage');
                },
                child:
                    ListTile(title: Text('Home'), leading: Icon(Icons.home))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Favourites'), leading: Icon(Icons.favorite))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Orders'), leading: Icon(Icons.shopping_bag))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('My account'), leading: Icon(Icons.person))),
            InkWell(
                onTap: () {
                  user.signOut();
                },
                child: ListTile(
                    title: Text('Log out'), leading: Icon(Icons.logout))),
            Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Settings'), leading: Icon(Icons.settings))),
            InkWell(
                onTap: () {},
                child: ListTile(title: Text('Help'), leading: Icon(Icons.help)))
          ],
        ),
      ),
      body: ListView(
        children: [
          Label(label: 'Categories'),
          Categories(),
          Label(label: 'Items'),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Itemdetails();
                        }));
                        itemNotifier.currentItem =
                            itemNotifier.item_list[index];
                      },
                      child: GridTile(
                        child: FutureBuilder(
                            future: _getImage(
                                context, itemNotifier.item_list[index].picture),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(child: snapshot.data);
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              return Container();
                            }),
                        footer: Container(
                          color: Colors.white70,
                          child: ListTile(
                            leading: Text(
                              itemNotifier.item_list[index].itemname,
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                              "Ksh ${itemNotifier.item_list[index].price}",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: itemNotifier.item_list.length),
          ),
        ],
      ),
    );
  }
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString());
  });
  return image;
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
