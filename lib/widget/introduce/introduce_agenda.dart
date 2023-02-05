import 'package:bside/service/model/agenda_model.dart';
import 'package:flutter/material.dart';

class AgendaItem extends StatelessWidget {
  String title, type, content;

  AgendaItem({
    Key? key,
    required this.title,
    required this.type,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: type == 'board'
                          ? Theme.of(context).hintColor
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      type == 'board' ? '이사회안' : '주주제안',
                      style: TextStyle(
                        color: type == 'board'
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  letterSpacing: -1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black45,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

class IntroduceAgenda extends StatelessWidget {
  final List<AgendaModel> agendas;

  const IntroduceAgenda({
    Key? key,
    required this.agendas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 70,
      ),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '주주총회제안',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          for (var agenda in agendas)
            AgendaItem(
              title: agenda.title!,
              type: agenda.type!,
              content: agenda.content!,
            ),
        ],
      ),
    );
  }
}
