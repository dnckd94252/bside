import 'package:flutter/material.dart';

class IntroduceVisual extends StatelessWidget {
  const IntroduceVisual({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        'https://blog.kakaocdn.net/dn/AsUoU/btrbkW7eo4L/ZL9xiUfpEKutRZCyVMAq11/img.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
