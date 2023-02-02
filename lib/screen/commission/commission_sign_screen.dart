import 'package:bside/screen/commission/commission_id_card_screen.dart';
import 'package:bside/widget/commission/commission_level.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class CommissionSignScreen extends StatefulWidget {
  CommissionSignScreen({super.key});
  String imageResouce =
      'https://mblogthumb-phinf.pstatic.net/MjAxODA2MTlfMTA2/MDAxNTI5NDA5OTI3ODEy.YXejGGBWtiGv8iyw-GSWh0jVuTeknmVHIT4JVERT8OQg.Y-f5tu8D8ys0yuAyXy1YrTOsLPxaVo0f7RcfcHoV8xog.PNG.rentallmoa/IMG_20180605_043359.png?type=w800';

  @override
  State<CommissionSignScreen> createState() => _CommissionSignScreenState();
}

class _CommissionSignScreenState extends State<CommissionSignScreen> {
  int activePage = 3;
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: CommissionSignNextBtn(showImage: showImage),
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
                            height: 200,
                          )
                        : const Text(
                            '서명을 직접 그려주세요.',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            showImage
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(.06),
                      ),
                      child: const Text(
                        '서명 다시하기',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class CommissionSignNextBtn extends StatelessWidget {
  bool showImage;

  CommissionSignNextBtn({
    Key? key,
    required this.showImage,
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
          if (showImage) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CommissionIdCardScreen(),
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
            showImage ? Theme.of(context).primaryColor : Colors.black12,
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
