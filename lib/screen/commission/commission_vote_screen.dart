import 'package:bside/screen/commission/commission_sign_screen.dart';
import 'package:bside/widget/commission/commission_vote_gradient.dart';
import 'package:bside/service/api/api_service.dart';
import 'package:bside/service/model/agenda_model.dart';
import 'package:bside/widget/commission/commission_level.dart';
import 'package:bside/widget/commission/commission_vote_item.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class CommissionVoteScreen extends StatefulWidget {
  const CommissionVoteScreen({super.key});

  @override
  State<CommissionVoteScreen> createState() => _CommissionVoteScreenState();
}

class _CommissionVoteScreenState extends State<CommissionVoteScreen> {
  Future<List<AgendaModel>> agendas = ApiService.getAgenda();
  int activePage = 2;
  int allAgendasCnt = 0;
  int checkNumber = 0;

  void plusCheckNumber() {
    setState(() {
      checkNumber = checkNumber + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        titleText: '전자위임',
        actionWidget: TextButton(
          onPressed: () {},
          child: const Text(
            '문의하기',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomSheet: CommissionVoteNextBtn(
        allAgendasCnt: allAgendasCnt,
        checkNumber: checkNumber,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommissionLevel(
              activePage: activePage,
              addWidget: const GradientItem(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: FutureBuilder(
                future: agendas,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    allAgendasCnt = snapshot.data!.length;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var agenda in snapshot.data!)
                          VoteItem(
                              agenda: agenda, plusCheckNumber: plusCheckNumber),
                        const Text(
                          '주주 총회에 새로 상정된 안건이나 변경 또는 수정 안건에 관하여 의결권을 행사할 것을 위임합니다.',
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '추가 지시사항',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckActionBtn extends StatelessWidget {
  final String type;
  String? selectType;
  dynamic setCheckType;
  dynamic plusCheckNumber;

  CheckActionBtn({
    Key? key,
    required this.type,
    required this.setCheckType,
    required this.plusCheckNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setCheckType(type: type);
          plusCheckNumber();
        },
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(.5),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  type == 'agree'
                      ? Icons.check
                      : type == 'disagree'
                          ? Icons.close
                          : Icons.change_history,
                  color: Colors.black87,
                  size: 40,
                ),
                Text(
                  type == 'agree'
                      ? '찬성'
                      : type == 'disagree'
                          ? '반대'
                          : '기권',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommissionVoteNextBtn extends StatelessWidget {
  final int allAgendasCnt;
  final int checkNumber;

  const CommissionVoteNextBtn({
    Key? key,
    required this.allAgendasCnt,
    required this.checkNumber,
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
          if (allAgendasCnt <= checkNumber) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CommissionSignScreen(),
              ),
            );
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            allAgendasCnt <= checkNumber
                ? Theme.of(context).primaryColor
                : Colors.black12,
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15)),
        ),
        child: const Text(
          '다음',
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
