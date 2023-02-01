import 'dart:convert';

import 'package:bside/service/model/agenda_model.dart';
import 'package:bside/service/model/detail_model.dart';
import 'package:bside/service/model/list_model.dart';
import 'package:bside/service/model/location_model.dart';
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

  static Future<DetailModel> getDetail() async {
    final String response = await rootBundle.loadString('assets/detail.json');
    DetailModel detailData;
    if (response.isNotEmpty) {
      final detail = await json.decode(response);
      detailData = DetailModel.fromJson(detail);
      return detailData;
    }
    throw Error();
  }

  static Future<List<AgendaModel>> getAgenda() async {
    final String response = await rootBundle.loadString('assets/agenda.json');
    List<AgendaModel> agendaData = [];
    if (response.isNotEmpty) {
      final List<dynamic> agendas = await json.decode(response);
      for (var agenda in agendas) {
        final agendaItem = AgendaModel.fromJson(agenda);
        agendaData.add(agendaItem);
      }
      return agendaData;
    }
    throw Error();
  }

  static Future<List<LocationModel>> getLocation() async {
    final String response = await rootBundle.loadString('assets/location.json');
    List<LocationModel> locationData = [];
    if (response.isNotEmpty) {
      final List<dynamic> locations = await json.decode(response);
      for (var location in locations) {
        final locationItem = LocationModel.fromJson(location);
        locationData.add(locationItem);
      }
      return locationData;
    }
    throw Error();
  }
}
