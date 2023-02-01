import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String titleText = '';
  final Widget? actionWidget;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  MyAppBar({
    Key? key,
    this.titleText = '',
    this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        titleText,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      actions: actionWidget == null ? null : [actionWidget!],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 30,
          color: Colors.black38,
        ),
      ),
    );
  }
}
