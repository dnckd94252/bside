import 'package:flutter/material.dart';

class AuthName extends StatefulWidget {
  dynamic nowStateNextButtonTrue;

  AuthName({
    Key? key,
    required this.nowStateNextButtonTrue,
  }) : super(key: key);

  @override
  State<AuthName> createState() => _AuthNameState();
}

class _AuthNameState extends State<AuthName> {
  var textController = TextEditingController();
  bool formCheck = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이름',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          TextField(
            controller: textController,
            onEditingComplete: () {
              if (textController.text.isNotEmpty) {
                setState(() {
                  formCheck = true;
                  widget.nowStateNextButtonTrue(check: true);
                });
              } else {
                setState(() {
                  formCheck = false;
                  widget.nowStateNextButtonTrue(check: false);
                });
              }
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  textController.clear();
                  setState(() {
                    formCheck = false;
                    widget.nowStateNextButtonTrue(check: false);
                  });
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.black54,
                ),
              ),
              hintText: '이름을 입력해주세요.',
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
                  ? '이름을 최소 1자 이상 입력해주세요.'
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
