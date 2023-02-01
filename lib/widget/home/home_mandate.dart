import 'package:bside/screen/introduce_screen.dart';
import 'package:bside/service/api/api_service.dart';
import 'package:bside/service/model/list_model.dart';
import 'package:bside/widget/home/mondate_title.dart';
import 'package:flutter/material.dart';

class HomeScreenMandate extends StatelessWidget {
  HomeScreenMandate({
    Key? key,
  }) : super(key: key);

  final Future<List<ListModel>> listData = ApiService.getList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MandateTitle(
          company: listData,
        ),
        const SizedBox(
          height: 20,
        ),
        MandateCompany(listData: listData),
      ],
    );
  }
}

class MandateCompany extends StatelessWidget {
  final Future<List<ListModel>> listData;

  const MandateCompany({
    super.key,
    required this.listData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listData,
      builder: ((context, snapshot) {
        bool isCheck = snapshot.hasData;
        if (isCheck) {
          return Container(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var list in snapshot.data!)
                  CompanyActiveItem(
                    url: '${list.thumb}',
                  ),
                for (int i = 5 - snapshot.data!.length; i > 0; i--)
                  const CompanyNullItem(),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

class CompanyActiveItem extends StatelessWidget {
  final String url;

  const CompanyActiveItem({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IntroduceScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
        width: 55,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              url,
              width: 30,
              height: 30,
              scale: .3,
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyNullItem extends StatelessWidget {
  const CompanyNullItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black26,
      ),
      width: 55,
      height: 55,
    );
  }
}

class CompanyLoadingItem extends StatelessWidget {
  const CompanyLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black26,
      ),
      width: 55,
      height: 55,
    );
  }
}
