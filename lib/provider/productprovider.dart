import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileappintern/model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;
  List<Product> get deals => _products.where((p) => p.hasdeal).toList();

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');

    final List<dynamic> data = json.decode(response);

    _products = data.map((item) => Product.fromJson(item)).toList();

    notifyListeners();
  }

  Product getproductbyid(int id) {
    return _products[id];
  }
  List<Product> getproductsbycategories(String categorie){
    List<Product> categorieproducts = _products
        .where((product) => product.category.toLowerCase() == categorie.toLowerCase())
        .toList();
    return categorieproducts;
  }
  List<Product> getdeals() {
    List<Product> deals = _products
        .where((product) => product.hasdeal)
        .toList();
    return deals;
  }
    List<Product> searchQuery({required String searchtext,required List<Product> passedlist}){
    List<Product> searchlist=passedlist
        .where((element) =>element.title
          .toLowerCase()
          .contains(searchtext.toLowerCase()))
          .toList();
    return searchlist;
  }

}
