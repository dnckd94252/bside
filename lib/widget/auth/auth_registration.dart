import 'package:bside/widget/auth/agency/agency_modal.dart';
import 'package:bside/widget/auth/registration/first_registration_container.dart';
import 'package:bside/widget/auth/registration/second_registration_container.dart';
import 'package:flutter/material.dart';

class AuthRegistration extends StatefulWidget {
  final dynamic nowStateAgencyTrue;

  const AuthRegistration({
    Key? key,
    required this.nowStateAgencyTrue,
  }) : super(key: key);
  
  @override
  State<AuthRegistration> createState() => _AuthRegistrationState();
}

class _AuthRegistrationState extends State<AuthRegistration> {
  Map<String, bool> formCheck = {
    'first': false,
    'second': false,
  };

  void formCheckChangeState({
    required String name,
    required bool state,
  }) {
    setState(() {
      formCheck[name] = state;
    });
    if (formCheck['first'] == true && formCheck['second'] == true) {
      AgencyModal.showModal(
        context: context,
        nowStateAgencyTrue: widget.nowStateAgencyTrue,
      );
    }
  }

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
            '주민등록번호',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          Row(
            children: [
              FirstRagistrationContainer(
                formCheckChangeState: formCheckChangeState,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SecondRegistrationContainer(
                formCheckChangeState: formCheckChangeState,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
