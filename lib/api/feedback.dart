import 'package:http/http.dart' as http;
import '../models/Feedback.dart';
import 'dart:convert';

class feedBackApi {
  static Future<List<FeedBack>> fetchFeedBack() async {
    final url = Uri.parse("http://localhost:8000/controller/Feedback");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    print("function called");
    print(data.map<FeedBack>(FeedBack.fromJson).toList());

    return data.map<FeedBack>(FeedBack.fromJson).toList();
  }
}
