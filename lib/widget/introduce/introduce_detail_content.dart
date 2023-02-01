import 'package:bside/widget/introduce/introduce_content.dart';
import 'package:bside/widget/introduce/introduce_content_link_item.dart';
import 'package:bside/widget/introduce/introduce_detail.dart';
import 'package:bside/widget/introduce/introduce_visual.dart';
import 'package:flutter/material.dart';

// class DetailContent extends StatelessWidget {
//   final String title, moderator, introduce;
//   final DateTime datePlan;

//   const DetailContent({
//     Key? key,
//     required this.datePlan,
//     required this.title,
//     required this.moderator,
//     required this.introduce,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class IntroduceDetailItem extends StatelessWidget {
  const IntroduceDetailItem({
    Key? key,
    required this.title,
    required this.datePlan,
    required this.moderator,
    required this.introduce,
  }) : super(key: key);

  final String title;
  final DateTime datePlan;
  final String moderator;
  final String introduce;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IntroduceVisual(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ContentComponent(
                title: '주주 총회 일정',
                content: '${datePlan.year} ${datePlan.month}월 ${datePlan.day}일',
              ),
              ContentComponent(
                title: '모더레이터',
                content: moderator,
              ),
              const SizedBox(
                height: 10,
              ),
              IntroduceDetail(
                content: introduce,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              IntroduceContentLinkItem(
                title: '의결권권유 공시',
              ),
              IntroduceContentLinkItem(
                title: '주주총회소집공고',
              ),
            ],
          )
        ],
      ),
    );
  }
}
