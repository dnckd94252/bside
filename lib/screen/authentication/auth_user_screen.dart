import 'package:bside/screen/authentication/auth_certificate_screen.dart';
import 'package:bside/widget/auth/auth_agency.dart';
import 'package:bside/widget/auth/auth_name.dart';
import 'package:bside/widget/auth/auth_phone.dart';
import 'package:bside/widget/auth/auth_registration.dart';
import 'package:bside/widget/auth/auth_title_text.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class AuthUserScreen extends StatefulWidget {
  const AuthUserScreen({super.key});

  @override
  State<AuthUserScreen> createState() => _AuthUserScreenState();
}

class _AuthUserScreenState extends State<AuthUserScreen> {
  String nowTarget = 'phone';
  bool nextButton = false;
  late String agency;

  Map nowState = {
    'phone': true,
    'registration': false,
    'agency': false,
    'name': false,
    'bottom': false,
  };

  final Map targetList = {
    'phone': '휴대폰번호를',
    'registration': '주민등록번호를',
    'name': '이름을',
  };

  void nowStateRegistrationTrue() {
    setState(() {
      nowState['registration'] = true;
      nowTarget = 'registration';
    });
  }

  void nowStateAgencyTrue({required String name}) {
    setState(() {
      agency = name;
      nowState['agency'] = true;
      nowState['name'] = true;
      nowTarget = 'name';
    });
  }

  void nowStatenameTrue() {
    setState(() {
      nowState['name'] = true;
      nowTarget = 'name';
    });
  }

  void nowStateNextButtonTrue({required bool check}) {
    setState(() {
      nextButton = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: nowState['name'] == true
            ? AuthNextPage(nextButton: nextButton)
            : null,
        appBar: MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTitleText(
                  target: targetList[nowTarget],
                ),
                nowState['name'] == true
                    ? AuthName(nowStateNextButtonTrue: nowStateNextButtonTrue)
                    : Container(),
                nowState['agency'] == true
                    ? AuthAgency(
                        agencyName: agency,
                        nowStateAgencyTrue: nowStateAgencyTrue,
                      )
                    : Container(),
                nowState['registration'] == true
                    ? AuthRegistration(
                        nowStateAgencyTrue: nowStateAgencyTrue,
                      )
                    : Container(),
                nowState['phone'] == true
                    ? AuthPhone(
                        nowStateRegistrationTrue: nowStateRegistrationTrue)
                    : Container(),
              ],
            ),
          ),
        ));
  }
}

class AuthNextPage extends StatelessWidget {
  bool nextButton;
  
  AuthNextPage({
    Key? key,
    required this.nextButton,
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
          if (nextButton == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AuthCertificateScreen(),
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
            nextButton == true
                ? Theme.of(context).primaryColor
                : Colors.black54,
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15)),
        ),
        child: const Text(
          '확인',
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
