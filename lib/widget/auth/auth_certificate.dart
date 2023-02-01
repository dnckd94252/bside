import 'package:bside/screen/authentication/auth_success_screen.dart';
import 'package:flutter/material.dart';

class AuthCertificate extends StatefulWidget {
  const AuthCertificate({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthCertificate> createState() => _AuthCertificateState();
}

class _AuthCertificateState extends State<AuthCertificate> {
  var textController = TextEditingController();
  bool formCheck = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              if (value.length >= 6) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthSuccessScreen(),
                  ),
                );
              }
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            controller: textController,
            maxLength: 6,
            decoration: InputDecoration(
              suffixText: '3 : 00',
              suffixStyle: const TextStyle(
                color: Colors.black,
              ),
              hintText: '6자리 숫자',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorText: formCheck == false && textController.text.isEmpty
                  ? '인증번호 6자리를 입력해주세요.'
                  : null,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
