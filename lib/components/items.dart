import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  var item_list= [
    {
      "Name":"Mobile Phone",
      "Picture":"assets/items/iphone12.jpg",
      "Price": 1,
    },
    {
      "Name":"Bed",
      "Picture":"assets/items/bed.jpg",
      "Price": 1,
    },
    {
      "Name":"Couch",
      "Picture":"assets/items/couch.jpg",
      "Price": 1,
    },
    {
      "Name":"Dress",
      "Picture":"assets/items/dress.jpg",
      "Price": 1,
    },
    {
      "Name":"Mobile Phone",
      "Picture":"assets/items/iphone12.jpg",
      "Price": 1,
    },
    {
      "Name":"Bed",
      "Picture":"assets/items/bed.jpg",
      "Price": 1,
    },
    {
      "Name":"Couch",
      "Picture":"assets/items/couch.jpg",
      "Price": 1,
    },
    {
      "Name":"Dress",
      "Picture":"assets/items/dress.jpg",
      "Price": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index)=> Item(
          itemname: item_list[index]['Name'],
          itempicture: item_list[index]['Picture'],
          itemprice: item_list[index]['Price'],
        ),
        itemCount: item_list.length,
    );
  }
}

class Item extends StatelessWidget {
  final itemname;
  final itempicture;
  final itemprice;
  Item({this.itemname,this.itempicture,this.itemprice});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Hero(
        tag: itemname,
        child: Material(
          child: InkWell(onTap: (){},
            child: GridTile(
              child: Image.asset(itempicture,),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(itemname,textAlign: TextAlign.left,),
                  title: Text("Ksh $itemprice",textAlign: TextAlign.right,),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
