import 'package:bside/service/model/list_model.dart';
import 'package:flutter/material.dart';

class MandateTitle extends StatelessWidget {
  final Future<List<ListModel>> company;

  const MandateTitle({
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              '전자위임 대상 회사',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            FutureBuilder(
              future: company,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data!.length}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
              }),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black38,
            size: 25,
          ),
        )
      ],
    );
  }
}
