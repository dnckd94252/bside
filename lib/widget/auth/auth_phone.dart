import 'package:flutter/material.dart';

class AuthPhone extends StatefulWidget {
  final dynamic nowStateRegistrationTrue;

  const AuthPhone({
    Key? key,
    required this.nowStateRegistrationTrue,
  }) : super(key: key);

  @override
  State<AuthPhone> createState() => _AuthPhoneState();
}

class _AuthPhoneState extends State<AuthPhone> {
  String phoneNumber = '';
  bool formCheck = false;

  final RegExp phoneRegex = RegExp(r'^([0-9]{3})\s([0-9]{4})\s([0-9]{4})$');
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void checkTextField() {
      bool matchPhoneRegex = phoneRegex.hasMatch(textController.value.text);
      setState(() {
        formCheck = matchPhoneRegex;
      });
      FocusScope.of(context).unfocus();
      if (formCheck == true) {
        widget.nowStateRegistrationTrue();
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '휴대폰번호',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          TextField(
            onEditingComplete: checkTextField,
            controller: textController,
            maxLength: 13,
            onChanged: ((value) {
              String spaceRemove = value.replaceAll(' ', "");
              spaceRemove = spaceRemove.replaceAllMapped(
                  RegExp(r'(\d{3})(\d{3,4})(\d{4})'),
                  (m) => '${m[1]} ${m[2]} ${m[3]}');
              textController.value = TextEditingValue(text: spaceRemove);
              textController.selection = TextSelection.fromPosition(
                  TextPosition(offset: spaceRemove.length));
              phoneNumber = textController.value.text;
            }),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: "",
              errorText: formCheck == false && phoneNumber.isNotEmpty
                  ? '올바르지 않은 형식입니다.'
                  : null,
              suffixIcon: formCheck == false && phoneNumber.isNotEmpty
                  ? const Icon(
                      Icons.error,
                      color: Colors.red,
                    )
                  : null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              hintText: '휴대폰 번호를 입력해주세요.',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
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
