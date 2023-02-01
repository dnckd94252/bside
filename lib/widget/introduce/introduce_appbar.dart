import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class IntroduceAppBar extends StatelessWidget with PreferredSizeWidget {
  final String company;

  const IntroduceAppBar({
    Key? key,
    required this.company,
  }) : super(key: key);
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return MyAppBar(
      titleText: company,
    );
  }
}
