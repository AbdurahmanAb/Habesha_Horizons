import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Dictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    translator.translate("I love Brazil!", from: 'en', to: 'pt').then((s) {
      print(s);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Dart"),
      ),
      body: SizedBox(
        child: Text(''),
      ),
    );
  }
}
