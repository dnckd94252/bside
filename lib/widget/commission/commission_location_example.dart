import 'package:flutter/material.dart';

class ExampleContainer extends StatelessWidget {
  const ExampleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: const Text(
              '이렇게 검색해 보세요.',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ),
          const SearchExample(
            title: '도로명 + 건물번호',
            exmaple: '예) 비사이드로 24길 14',
          ),
          const SearchExample(
            title: '지역명 + 번지',
            exmaple: '예) 비사이드동 24-14',
          ),
          const SearchExample(
            title: '건물명, 아파트명',
            exmaple: '예) 비사이드아파트 204동',
          ),
        ],
      ),
    );
  }
}

class SearchExample extends StatelessWidget {
  final String title;
  final String exmaple;

  const SearchExample({
    Key? key,
    required this.title,
    required this.exmaple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                size: 5,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 13,
            ),
            child: Text(
              exmaple,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
