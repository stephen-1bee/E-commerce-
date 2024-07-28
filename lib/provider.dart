import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // empty list of maps
  final List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
