import 'package:flutter/foundation.dart';

class CategoriesModel {
  final String name;
  final String image;

  CategoriesModel({required this.name, required this.image});
}

final List<CategoriesModel> Categories = [
  CategoriesModel(name: "Desert", image: "assets/icon/desert"),
  CategoriesModel(name: "Park", image: "assets/icon/hotel"),
  CategoriesModel(name: "Forest", image: "assets/icon/desert"),
  CategoriesModel(name: "Beach", image: "assets/icon/desert"),
];
