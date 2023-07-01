import 'package:flutter/material.dart';

class PlacesModel {
  final String Image;
  final String Desc;
  final int Id;
  final String Title;

  PlacesModel(
      {required this.Image,
      required this.Desc,
      required this.Id,
      required this.Title});
}

List<PlacesModel> PlaceModel = <PlacesModel>[
  PlacesModel(
      Image: "assets/bale.jpg",
      Desc: "Bale si Far from addis",
      Id: 22,
      Title: "title")
];
