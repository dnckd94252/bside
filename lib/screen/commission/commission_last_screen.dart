import 'package:bside/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CommissionLastScreen extends StatelessWidget {
  const CommissionLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: const CommissionLastBtn(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          '전자위임 내역',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen()),
                  (route) => false);
            },
            icon: const Icon(
              Icons.home_outlined,
              size: 25,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ComplateMessage(),
            Container(
              height: 10,
              color: Theme.of(context).splashColor,
            ),
            const InfoItem(
              title: '주소지 정보',
              active: false,
              contents: ['경기도 성남시 중원구 금빛로 114번길 21', '(은행동, 까치7차비라) 102호'],
            ),
            const InfoItem(
              title: '안건투표',
              active: true,
              contents: [
                '완료 날짜 : 2022년 11월 30일 오전 10:39',
              ],
            ),
            const InfoItem(
              title: '전자서명',
              active: true,
              contents: [
                '완료 날짜 : 2022년 11월 30일 오전 10:39',
              ],
            ),
            const InfoItem(
              title: '신분증 사본',
              active: true,
              contents: [
                '완료 날짜 : 2022년 11월 30일 오전 10:39',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final bool active;
  final String title;
  final List<String> contents;

  const InfoItem({
    Key? key,
    required this.active,
    required this.title,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black26,
          width: 1,
        ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (var content in contents)
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
            Icon(
              Icons.check_circle,
              size: 40,
              color: active == false
                  ? Colors.black12
                  : Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ComplateMessage extends StatelessWidget {
  const ComplateMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '전자위임이 완료되었어요',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '에스엠 엔터테인먼트',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '완료 날짜 : 2022년 11월 30일 오전 10:39',
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '보유주식수 : 2,000주',
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class CommissionLastBtn extends StatelessWidget {
  const CommissionLastBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15)),
        ),
        child: const Text(
          '수정하기',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
