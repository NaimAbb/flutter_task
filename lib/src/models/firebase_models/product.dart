import 'package:flutter/foundation.dart';

class Product {
  String? id;
  String? name;
  String? image;
  int? numberBrands;

  Product({
    this.id,
    @required this.name,
    @required this.image,
    @required this.numberBrands,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'],
        image: json['image'],
        numberBrands: json['numberBrands'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'numberBrands': numberBrands,
      };
}
