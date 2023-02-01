import 'package:flutter/material.dart';

class FirstRagistrationContainer extends StatefulWidget {
  dynamic formCheckChangeState;

  FirstRagistrationContainer({
    Key? key,
    required this.formCheckChangeState,
  }) : super(key: key);

  @override
  State<FirstRagistrationContainer> createState() =>
      _FirstRagistrationContainerState();
}

class _FirstRagistrationContainerState
    extends State<FirstRagistrationContainer> {
  TextEditingController textController = TextEditingController();

  bool formCheck = true;

  @override
  Widget build(BuildContext context) {
    void checkTextField() {
      final String textValue = textController.value.text;
      if (textValue.length == 6) {
        widget.formCheckChangeState(
          name: 'first',
          state: true,
        );
        setState(() {
          formCheck = true;
        });
      } else {
        widget.formCheckChangeState(
          name: 'first',
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
      child: TextField(
        controller: textController,
        onEditingComplete: checkTextField,
        maxLength: 6,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorText:
              formCheck == false && textController.text.length != 6 ? '' : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: 'ex)920602',
          counterText: "",
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
    );
  }
}
