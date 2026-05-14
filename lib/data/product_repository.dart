import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product.dart';

class ProductRepository {
  static Future<List<Product>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> jsonData = jsonDecode(jsonString) as List<dynamic>;

    return jsonData
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
