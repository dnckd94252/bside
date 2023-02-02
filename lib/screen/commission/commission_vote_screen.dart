import 'package:bside/screen/commission/commission_sign_screen.dart';
import 'package:bside/widget/commission/commission_vote_gradient.dart';
import 'package:bside/service/api/api_service.dart';
import 'package:bside/service/model/agenda_model.dart';
import 'package:bside/widget/commission/commission_level.dart';
import 'package:bside/widget/commission/commission_vote_item.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

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
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showBannerDialog();
    });
    super.initState();
  }

  showBannerDialog() {
    AgendaModel exampleData = AgendaModel.fromJson({
      'id': 1,
      'title': '제 0호 제안',
      'type': 'board',
      'content': '재무제표 승인의 건입니다.',
    });

    showDialog(
      context: context,
      builder: ((context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return AlertDialog(
              elevation: 0,
              insetPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return SizedBox(
                    height: height - 100,
                    width: width - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 110,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const GradientItem(),
                            const GuideText(
                              guide: '투표하기 전 작성예시를 볼 수 있어요!',
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            GestureDetector(
                              onTap: null,
                              child: VoteItem(
                                agenda: exampleData,
                                plusCheckNumber: plusCheckNumber,
                              ),
                            ),
                            const GuideText(
                              guide: '안건을 확인하고 소중한 권리를 행사하세요!',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        );
      }),
    );
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

class GuideText extends StatelessWidget {
  final String guide;

  const GuideText({
    required this.guide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: 70 * math.pi / 180,
          child: const Icon(
            Icons.moving,
            color: Color(0xFFFBC002),
            size: 30,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 30,
            left: 10,
          ),
          child: Text(
            guide,
            style: const TextStyle(
              color: Color(0xFFFBC002),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
