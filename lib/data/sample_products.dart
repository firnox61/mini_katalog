import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product.dart';

Future<List<Product>> loadProducts() async {
  final jsonString = await rootBundle.loadString(
    'assets/data/products.json',
  );

  final jsonList = jsonDecode(jsonString) as List<dynamic>;

  return jsonList
      .map(
        (item) => Product.fromJson(item as Map<String, dynamic>),
      )
      .toList();
}