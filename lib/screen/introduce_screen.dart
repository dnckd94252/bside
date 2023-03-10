import 'package:bside/screen/authentication/auth_user_screen.dart';
import 'package:bside/service/api/api_service.dart';
import 'package:bside/service/model/agenda_model.dart';
import 'package:bside/service/model/detail_model.dart';
import 'package:bside/widget/introduce/introduce_agenda.dart';
import 'package:bside/widget/introduce/introduce_appbar.dart';
import 'package:bside/widget/introduce/introduce_detail_content.dart';
import 'package:flutter/material.dart';

class IntroduceScreen extends StatelessWidget {
  IntroduceScreen({super.key});
  final Future<DetailModel> detail = ApiService.getDetail();
  final Future<List<AgendaModel>> agendas = ApiService.getAgenda();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detail,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final datePlan = DateTime.parse('${snapshot.data!.date}');
          return Scaffold(
            backgroundColor: const Color(0xFFF8FAFB),
            bottomSheet: const IntroduceBottom(),
            appBar: IntroduceAppBar(company: '${snapshot.data!.company}'),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  IntroduceDetailItem(
                    title: '${snapshot.data!.title}',
                    datePlan: datePlan,
                    moderator: '${snapshot.data!.moderator}',
                    introduce: '${snapshot.data!.introduce}',
                  ),
                  FutureBuilder(
                    future: agendas,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return IntroduceAgenda(
                          agendas: snapshot.data!,
                        );
                      }
                      return Container();
                    }),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

class IntroduceBottom extends StatelessWidget {
  const IntroduceBottom({
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
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15)),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return const IntroduceModal();
              }));
        },
        child: const Text(
          '???????????? ????????????',
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

class IntroduceModal extends StatelessWidget {
  const IntroduceModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text("?????? ??????"),
      ),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("????????? ????????? ??????"),
            Text("??????????????? ????????????."),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffeceeef),
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 10,
                    )),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '??????',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AuthUserScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 10)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '????????????',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
