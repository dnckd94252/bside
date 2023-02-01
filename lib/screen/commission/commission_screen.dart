import 'package:bside/widget/auth/auth_title_text.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class CommissionScreen extends StatefulWidget {
  const CommissionScreen({super.key});

  @override
  State<CommissionScreen> createState() => _CommissionScreenState();
}

class _CommissionScreenState extends State<CommissionScreen> {
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '주주명부 확인',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      for (var count = 1; count <= 5; count++)
                        NumberGuide(
                          active: activePage == count ? true : false,
                          value: '$count',
                        )
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: AuthTitleText(
                  target: '주소와 보유주식수를',
                  other: '확인해 주세요.',
                ),
                
              ),
            ],
          ),
        ),
      ),
      appBar: MyAppBar(
        titleText: '전자위임',
        actionWidget: TextButton(
          child: const Text(
            '문의하기',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class NumberGuide extends StatelessWidget {
  final String value;
  final bool active;

  const NumberGuide({
    Key? key,
    required this.value,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
      ),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: active
            ? Theme.of(context).primaryColor
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: active ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
