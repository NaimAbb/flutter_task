import 'package:flutter/material.dart';
import 'package:flutter_task/src/controllers/firebase_controllers/categories_controller.dart';
import 'package:flutter_task/src/controllers/firebase_controllers/products_controller.dart';
import 'package:flutter_task/src/models/firebase_models/category.dart';
import 'package:flutter_task/src/models/firebase_models/product.dart';

class HomeScreenNotifier with ChangeNotifier {
//   // ||....................... notifiable ..................................||
  bool _isLoadingCategories = true;
  bool _isLoadingProducts = true;

  bool get isLoadingProducts => _isLoadingCategories;

  set isLoadingProducts(bool value) {
    _isLoadingCategories = value;
    notifyListeners();
  }

  bool get isLoadingSpecialProduct => _isLoadingProducts;

  set isLoadingSpecialProduct(bool value) {
    _isLoadingProducts = value;
    notifyListeners();
  }

// ||....................... notifiable ..................................||
  List<Category> categories = [];
  List<Product> products = [];

  //  controllers.
  ProductsController? _productsController;
  CategoriesController? _categoriesController;

  HomeScreenNotifier() {
    _productsController = ProductsController.instance;
    _categoriesController = CategoriesController.instance;
    getCategories();
    getProducts();
  }

  //--------------------------------------------------------------------------------------------------//
//  ||...................... logic methods ............................||

  //||... get categories ...||
  void getCategories() async {
    try {
      categories = await _categoriesController!.getCategories();
      isLoadingProducts = false;
    } catch (error) {
      print(error);
    }
  }

  //||... get products ...||
  void getProducts() async {
    try {
      products = await _productsController!.getProducts();
      isLoadingSpecialProduct = false;
    } catch (error) {
      print(error);
    }
  }

// ||...................... logic methods ............................||

}
