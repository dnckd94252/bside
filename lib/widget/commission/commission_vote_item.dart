import 'package:bside/screen/commission/commission_vote_screen.dart';
import 'package:bside/service/model/agenda_model.dart';
import 'package:flutter/material.dart';

class VoteItem extends StatefulWidget {
  final AgendaModel agenda;
  final dynamic plusCheckNumber;

  const VoteItem({
    Key? key,
    required this.agenda,
    required this.plusCheckNumber,
  }) : super(key: key);

  @override
  State<VoteItem> createState() => _VoteItemState();
}

class _VoteItemState extends State<VoteItem> {
  String? checkType;

  void setCheckType({required String type}) {
    setState(() {
      checkType = type;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return checkType == null
        ? Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.agenda.title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        '미투표',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.agenda.type == 'board' ? '이사회안' : '주주제안',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.agenda.content!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CheckActionBtn(
                      type: 'agree',
                      setCheckType: setCheckType,
                      plusCheckNumber: widget.plusCheckNumber,
                    ),
                    CheckActionBtn(
                      type: 'disagree',
                      setCheckType: setCheckType,
                      plusCheckNumber: widget.plusCheckNumber,
                    ),
                    CheckActionBtn(
                      type: 'abstain',
                      setCheckType: setCheckType,
                      plusCheckNumber: widget.plusCheckNumber,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.agenda.type == 'board' ? '이사회안' : '주주제안',
                      style: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.agenda.title!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            checkType == 'agree'
                                ? '찬성'
                                : checkType == 'disagree'
                                    ? '반대'
                                    : '기권',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          );
  }
}
