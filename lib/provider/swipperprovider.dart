import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileappintern/model/swipermodel.dart';


class Swipperprovider with ChangeNotifier {
  List<Swipermodel> _swipper = [];

  List<Swipermodel> get swipper => _swipper;

  Future<void> loadswipper() async {
    final String response =
        await rootBundle.loadString('assets/swiperimage.json');

    final List<dynamic> data = json.decode(response);

    _swipper = data
        .map((item) => Swipermodel.fromJson(item))
        .toList();

    notifyListeners();
  }


}