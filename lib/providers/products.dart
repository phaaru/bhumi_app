import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Bhindi',
      description: 'Local Bhindi',
      price: 35,
      image: 'assets/images/bhindi.jpg',
      imageMain: 'assets/images/bhindi_main.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Cabbage',
      description: 'Leafy Cabbage',
      price: 40,
      image: 'assets/images/cabbage.jpg',
      imageMain: 'assets/images/img.png',
    ),
    Product(
      id: 'p3',
      title: 'Garlic',
      description: '100% organic',
      price: 100,
      image: 'assets/images/onion.jpg',
      imageMain: 'assets/images/bhindi_main.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Product> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    // _items.add(value);
    final newProduct = Product(
      title: product.title,
      price: product.price,
      description: product.description,
      id: DateTime.now().toString(),
      image: product.image,
    );

    _items.add(newProduct);

    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
