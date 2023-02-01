import 'package:flutter/material.dart';

class IntroduceDetail extends StatefulWidget {
  final String content;

  const IntroduceDetail({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<IntroduceDetail> createState() => _IntroduceDetailState();
}

class _IntroduceDetailState extends State<IntroduceDetail> {
  bool more = false;

  void onMorePress() {
    setState(() {
      if (more == true) {
        more = false;
      } else {
        more = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        children: [
          Text(
            more == true ? widget.content : widget.content.substring(0, 60),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          TextButton(
            onPressed: onMorePress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  more == true ? '닫기' : '더보기',
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  more == true
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
