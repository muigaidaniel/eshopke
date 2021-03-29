import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  String fieldName;
  String iconName;
  InputField ({ Key key, this.fieldName, this.iconName }): super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: TextStyle(fontSize: 20,),
        decoration: InputDecoration(
            hintStyle: TextStyle( fontSize: 20),
            hintText: widget.fieldName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: Icon(Icons.person,color: Theme.of(context).primaryColor),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }
}