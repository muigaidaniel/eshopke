import 'package:flutter/material.dart';
import 'package:eshopke/data/itemlist.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
        height: MediaQuery.of(context).size.height*0.6,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index)=> Favourite(
            itemname: item_list[index]['Name'],
            itempicture: item_list[index]['Picture'],
            itemprice: item_list[index]['Price'],
          ),
          itemCount: item_list.length,
        ),
    );
  }
}

class Favourite extends StatelessWidget {
  final itemname;
  final itempicture;
  final itemprice;
  Favourite({this.itemname,this.itempicture,this.itemprice});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 10,
      color: Colors.white,
      child: InkWell(onTap: (){Navigator.pushNamed(context, '/itemdetails',arguments: Favourite(itemname: itemname,itempicture: itempicture,itemprice: itemprice,));},
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
    );
  }
}

