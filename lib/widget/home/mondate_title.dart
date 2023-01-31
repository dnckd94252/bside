import 'package:flutter/material.dart';

class MandateTitle extends StatelessWidget {
  const MandateTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              '전자위임 대상 회사',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '2',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black38,
            size: 25,
          ),
        )
      ],
    );
  }
}
