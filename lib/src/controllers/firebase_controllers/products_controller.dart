import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/src/models/firebase_models/product.dart';
import 'package:flutter_task/src/utils/constants.dart';

class ProductsController {
  static ProductsController? _instance;
  FirebaseFirestore? _db;

//   ||.. private constructor ..||
  ProductsController._() {
    _db = FirebaseFirestore.instance;
  }

//   ||.. singleton pattern ..||
  static ProductsController? get instance {
    if (_instance != null) return _instance!;
    return _instance = ProductsController._();
  }

////       ------------------ || .. usable  methods ..|| ----------------------

  // get products.
  Future<List<Product>> getProducts() async {
    QuerySnapshot querySnapshot = await _db!
        .collection(Constants.FIREBASE_COLLECTIONS_PRODUCTS)
        .limit(10)
        .get();
    return List<Product>.from(
        querySnapshot.docs.map((e) => Product.fromJson((e.data()))..id = e.id));
  }
}
