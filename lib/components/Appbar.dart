import 'package:flutter/material.dart';
import 'package:alquranMobile/utils/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final List<Widget> actions;

  CustomAppBar({
    @required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        child: Container(
          color: ColorBase.separator,
          height: 1.0,
        ),
      preferredSize: preferredSize
      ),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: ColorBase.black
        ),
      ),
      backgroundColor: ColorBase.white,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}