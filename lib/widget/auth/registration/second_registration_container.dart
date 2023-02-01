import 'package:flutter/material.dart';

class SecondRegistrationContainer extends StatefulWidget {
  dynamic formCheckChangeState;

  SecondRegistrationContainer({
    Key? key,
    required this.formCheckChangeState,
  }) : super(key: key);

  @override
  State<SecondRegistrationContainer> createState() =>
      _SecondRegistrationContainerState();
}

class _SecondRegistrationContainerState
    extends State<SecondRegistrationContainer> {
  TextEditingController textController = TextEditingController();
  bool formCheck = true;

  @override
  Widget build(BuildContext context) {
    void checkTextField() {
      final String textValue = textController.value.text;
      if (textValue.length == 1) {
        widget.formCheckChangeState(
          name: 'second',
          state: true,
        );
        setState(() {
          formCheck = true;
        });
      } else {
        widget.formCheckChangeState(
          name: 'second',
          state: false,
        );
        setState(() {
          formCheck = false;
        });
      }
      FocusScope.of(context).unfocus();
    }

    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              controller: textController,
              onEditingComplete: checkTextField,
              maxLength: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                errorText: formCheck == false && textController.text.length != 1
                    ? ''
                    : null,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: '',
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
          ),
          const CircleDeco(),
          const CircleDeco(),
          const CircleDeco(),
          const CircleDeco(),
          const CircleDeco(),
          const CircleDeco(),
        ],
      ),
    );
  }
}

class CircleDeco extends StatelessWidget {
  const CircleDeco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      flex: 1,
      child: Icon(
        Icons.circle,
        color: Colors.black54,
        size: 23,
      ),
    );
  }
}
