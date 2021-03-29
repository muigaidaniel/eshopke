import 'package:flutter/material.dart';
import 'package:eshopke/data/itemlist.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 5,color: Colors.transparent),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
        height: MediaQuery.of(context).size.height*0.6,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index)=> Item(
              itemname: item_list[index]['Name'],
              itempicture: item_list[index]['Picture'],
              itemprice: item_list[index]['Price'],
            ),
            itemCount: item_list.length,
        ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 10,
      color: Colors.white,
      child: InkWell(onTap: (){Navigator.pushNamed(context, '/itemdetails',arguments: Item(itemname: itemname,itempicture: itempicture,itemprice: itemprice,));},
        child: GridTile(
          child: Image.asset(itempicture),
          footer: Container(
            color: Colors.white70,
            child: ListTile(
              leading: Text(itemname,textAlign: TextAlign.left,),
              title: Text("Ksh $itemprice",textAlign: TextAlign.right,),
            ),
          ),
        ),
      ),
    );
  }
}
