import 'package:bside/widget/auth/auth_title_text.dart';
import 'package:flutter/material.dart';

class CommissionLevel extends StatelessWidget {
  Widget? addWidget;

  CommissionLevel({
    Key? key,
    required this.activePage,
    this.addWidget,
  }) : super(key: key);

  final Map<int, List<String>> commissionMsg = {
    1: ['주주명부 확인', '주소와 보유주식수를', '확인해 주세요.'],
    2: ['안건투표', '안건에 대해', '찬성 혹은 반대를 선택해 주세요.'],
    3: ['전자서명', '전자서명을', '입력해 주세요.'],
    4: ['신분증 업로드', '신분증을', '업로드 해주세요.'],
  };

  final int activePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                commissionMsg[activePage]![0],
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
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 30,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black26,
              width: .5,
            ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTitleText(
                  target: commissionMsg[activePage]![1],
                  other: commissionMsg[activePage]![2],
                ),
                addWidget == null
                    ? Container(
                        height: 0,
                      )
                    : addWidget!,
              ],
            ),
          ),
        ],
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
