import 'package:flutter/material.dart';

class GradientItem extends StatelessWidget {
  const GradientItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF984BE5), Color(0xFF574DEA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.error,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '주주제안측 위임장 작성예시',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
