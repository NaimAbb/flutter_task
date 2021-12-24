import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/src/models/firebase_models/category.dart';
import 'package:flutter_task/src/utils/constants.dart';

class CategoriesController {
  static CategoriesController? _instance;
  FirebaseFirestore? _db;

//   ||.. private constructor ..||
  CategoriesController._() {
    _db = FirebaseFirestore.instance;
  }

//   ||.. singleton pattern ..||
  static CategoriesController? get instance {
    if (_instance != null) return _instance!;
    return _instance = CategoriesController._();
  }

////       ------------------ || .. usable  methods ..|| ----------------------

  // get categories.
  Future<List<Category>> getCategories() async {
    QuerySnapshot querySnapshot =
        await _db!.collection(Constants.FIREBASE_COLLECTIONS_CATEGORIES).get();
    return List<Category>.from(querySnapshot.docs
        .map((e) => Category.fromJson((e.data()))..id = e.id));
  }
}
