import 'package:flutter/material.dart';

class AgencyModal {
  static void showModal({
    required BuildContext context,
    required dynamic nowStateAgencyTrue,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 600,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          clipBehavior: Clip.hardEdge,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: const Text(
                    '통신사',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                AgencySelectBtn(
                    name: 'SKT', nowStateAgencyTrue: nowStateAgencyTrue),
                AgencySelectBtn(
                    name: 'KT', nowStateAgencyTrue: nowStateAgencyTrue),
                AgencySelectBtn(
                    name: 'LG U+', nowStateAgencyTrue: nowStateAgencyTrue),
                AgencySelectBtn(
                    name: 'SKT 알뜰폰', nowStateAgencyTrue: nowStateAgencyTrue),
                AgencySelectBtn(
                    name: 'KT 알뜰폰', nowStateAgencyTrue: nowStateAgencyTrue),
                AgencySelectBtn(
                    name: 'LG U+ 알뜰폰', nowStateAgencyTrue: nowStateAgencyTrue),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}

class AgencySelectBtn extends StatelessWidget {
  final String name;
  dynamic nowStateAgencyTrue;

  AgencySelectBtn({
    Key? key,
    required this.name,
    required this.nowStateAgencyTrue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: const ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        onPressed: () async {
          await nowStateAgencyTrue(name: name);
          Navigator.pop(context);
        },
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
