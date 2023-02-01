import 'package:flutter/material.dart';

class AuthTitleText extends StatelessWidget {
  final String target;
  final String? other;

  const AuthTitleText({
    Key? key,
    required this.target,
    this.other,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          target,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          other == null ? '입력해주세요.' : other!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
