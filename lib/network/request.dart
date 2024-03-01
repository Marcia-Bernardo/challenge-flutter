import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Product.dart';

class Request {
  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(
        'https://shopicruit.myshopify.com/admin/products.json?access_token=c32313df0d0ef512ca64d5b336a0d7c6'));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      List<Product> list = [];

      for (var product in res['products']) {
        var newProduct = Product.fromJson(product);
        list.add(newProduct);
      }

      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
