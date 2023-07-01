import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedBack {
  final int ratting;
  final int userId;
  final String comment;
  final int AttractionId;

  FeedBack({
    required this.ratting,
    required this.userId,
    required this.AttractionId,
    required this.comment,
  });

  static FeedBack fromJson(json) {
    return FeedBack(
      ratting: int.parse(json["Ratting"]),
      userId: int.parse(json["UserID"]),
      AttractionId: int.parse(json["AttractionID"]),
      comment: json["comment"],
    );
  }
}
