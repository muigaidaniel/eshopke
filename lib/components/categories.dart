import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height*0.125,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(image_location: 'assets/categories/clothes.png', caption: 'Clothes',),
          Category(image_location: 'assets/categories/electronics.png', caption: 'Electronics',),
          Category(image_location: 'assets/categories/furniture.png', caption: 'Furniture',),
          Category(image_location: 'assets/categories/kitchen.png', caption: 'Kitchen',)
        ],
      )
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String caption;

  Category({this.image_location,this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){},
          child: Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.245,
            child: ListTile(
              title: Image.asset(image_location, height: MediaQuery.of(context).size.height*0.07),
              subtitle: Text(caption, textAlign: TextAlign.center,),
            ),
          ),
        ),
    );
  }
}

