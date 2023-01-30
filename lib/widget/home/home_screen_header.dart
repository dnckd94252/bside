import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'bside',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
