import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
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
            width: 120.0,
            child: ListTile(
              title: Image.asset(image_location, height: 60.0,width: 100.0,),
              subtitle: Text(caption, textAlign: TextAlign.center,),
            ),
          ),
        ),
    );
  }
}

