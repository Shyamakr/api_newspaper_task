import 'dart:convert';

import 'package:api_newspaper_task/model/home_model/sample_api_home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  SampleapiNewsModel? newsModel;
  List<Newspaper>? dataList = [];
  bool isLoading = false;
  Future<void> fetchData() async {
    final Url = Uri.parse("https://chroniclingamerica.loc.gov/newspapers.json");
    var response = await http.get(Url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      newsModel = SampleapiNewsModel.fromJson(decodeData);
      if (newsModel != null) {
        dataList = newsModel?.newspapers ?? [];
      }
      print(newsModel?.newspapers?.first.url);
      notifyListeners();
    } else {
      bool isLoading = true;
      print("Api call failed");
    }
  }
}
