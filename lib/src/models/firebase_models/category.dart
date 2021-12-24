import 'package:flutter/foundation.dart';

class Category {
  String? id;
  String? name;
  String? image;

  Category({
    this.id,
    @required this.name,
    @required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
