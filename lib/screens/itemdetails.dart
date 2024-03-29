import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:eshopke/components/appbar.dart';
import 'package:eshopke/data/itemlist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Itemdetails extends StatefulWidget {
  const Itemdetails({
    Key key,
  }) : super(key: key);
  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    return Scaffold(
      appBar: AppBarNav(
          title: Text(itemNotifier.currentItem.itemname),
          appBar: AppBar(),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                })
          ]),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 300.0,
              color: Colors.black,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: FutureBuilder(
                      future:
                          _getImage(context, itemNotifier.currentItem.picture),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(child: snapshot.data);
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(child: CircularProgressIndicator());
                        }
                        return Container();
                      }),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(itemNotifier.currentItem.itemname,
                        style: TextStyle(fontSize: 20)),
                    title: Text(
                      "Ksh ${itemNotifier.currentItem.price}",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          itemNotifier.currentItem.description,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add to cart'),
                SizedBox(width: 10),
                Icon(Icons.shopping_cart)
              ],
            ),
            onPressed: () {
              final firestoreInstance = FirebaseFirestore.instance;

              firestoreInstance.collection("cart").add({
                "name": itemNotifier.currentItem.itemname,
                "price": itemNotifier.currentItem.price,
                "quantity": "1",
              });
              firestoreInstance.collection("orders").add({
                "name": itemNotifier.currentItem.itemname,
                "price": itemNotifier.currentItem.price,
                "quantity": "1",
              });
              Fluttertoast.showToast(msg: 'Item added to cart');
            }),
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
