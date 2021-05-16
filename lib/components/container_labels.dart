import 'package:flutter/material.dart';

class Label extends StatefulWidget {
  String label;
  Label({this.label});

  @override
  _LabelState createState() => _LabelState();
}

class _LabelState extends State<Label> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.05,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(0)
      ),
      padding: const EdgeInsets.fromLTRB(8,8,8,0),
      child: Text(widget.label)
    );
  }
}
