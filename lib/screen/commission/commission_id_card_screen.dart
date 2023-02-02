import 'package:bside/screen/commission/commission_last_screen.dart';
import 'package:bside/widget/commission/commission_level.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class CommissionIdCardScreen extends StatefulWidget {
  CommissionIdCardScreen({super.key});
  String imageResouce =
      'https://mediahub.seoul.go.kr/uploads/mediahub/2022/02/BpyzaEoXCIrAJXRtxjUjbuzXksnikKBQ.jpg';

  @override
  State<CommissionIdCardScreen> createState() => _CommissionIdCardScreenState();
}

class _CommissionIdCardScreenState extends State<CommissionIdCardScreen> {
  int activePage = 4;
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Row(
        children: [
          CommissionSignNextBtn(active: false),
          CommissionSignNextBtn(active: true),
        ],
      ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommissionLevel(
              activePage: activePage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showImage = true;
                  });
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: showImage
                        ? Image.network(
                            widget.imageResouce,
                            width: double.infinity,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_circle,
                                size: 40,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '신분증을 업로드 해주세요.',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '유의사항',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '• 신분증 사본은, 위임장 본인확인 증빙자료로 활용됩니다.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '• 촬영시 주민등록 뒷자리를 가려주세요.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '• 신분증 원본은 서버에서 뒷자리 마스킹 처리 후 삭제됩니다.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommissionSignNextBtn extends StatelessWidget {
  bool active;

  CommissionSignNextBtn({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20,
        ),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CommissionLastScreen(),
              ),
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              active ? Theme.of(context).primaryColor : Colors.black12,
            ),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15)),
          ),
          child: Text(
            !active ? '다음에 업로드' : '완료',
            style: TextStyle(
              color: !active ? Colors.black54 : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
