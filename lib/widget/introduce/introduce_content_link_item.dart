import 'package:flutter/material.dart';

class IntroduceContentLinkItem extends StatelessWidget {
  final String title;

  const IntroduceContentLinkItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.link,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 17,
          ),
        ],
      ),
    );
  }
}
