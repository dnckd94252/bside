import 'dart:convert';

import 'package:bside/service/model/list_model.dart';
import 'package:flutter/services.dart';

class ApiService {

  static Future<List<ListModel>> getList() async {
    final String response = await rootBundle.loadString('assets/list.json');
    List<ListModel> listData = [];
    if (response.isNotEmpty) {
      final List<dynamic> lists = await json.decode(response);
      for (var list in lists) {
        final listItem = ListModel.fromJson(list);
        listData.add(listItem);
      }
      return listData;
    }
    throw Error();
  }
  
  
}
