import 'package:bside/widget/auth/agency/agency_modal.dart';
import 'package:flutter/material.dart';

class AuthAgency extends StatefulWidget {
  String agencyName;
  final dynamic nowStateAgencyTrue;
  
  AuthAgency({
    Key? key,
    required this.agencyName,
    required this.nowStateAgencyTrue,
  }) : super(key: key);

  @override
  State<AuthAgency> createState() => _AuthAgencyState();
}

class _AuthAgencyState extends State<AuthAgency> {
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.value = TextEditingValue(text: widget.agencyName);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          AgencyModal.showModal(
            context: context,
            nowStateAgencyTrue: widget.nowStateAgencyTrue,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '통신사',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            TextField(
              enabled: false,
              readOnly: true,
              controller: textController,
              decoration: const InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.black26,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
