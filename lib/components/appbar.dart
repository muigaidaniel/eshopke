import 'package:flutter/material.dart';

class AppBarNav extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  final Text title;
  final List<Widget> actions;

  const AppBarNav({Key key, this.appBar,this.title,this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: actions
    );
  }
  @override Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
