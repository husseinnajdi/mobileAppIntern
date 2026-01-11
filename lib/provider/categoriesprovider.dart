import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobileappintern/model/categories.dart';


class Categoriesprovider with ChangeNotifier {
  List<CategoriesModel> _categories = [];

  List<CategoriesModel> get categories => _categories;

  Future<void> loadcategories() async {
    final String response =
        await rootBundle.loadString('assets/categories.json');

    final List<dynamic> data = json.decode(response);

    _categories = data
        .map((item) => CategoriesModel.fromJson(item))
        .toList();

    notifyListeners();
  }


}