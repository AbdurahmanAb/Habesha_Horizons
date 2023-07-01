import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/BottomNav.dart';
import '../widgets/bookmarks.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favourites extends StatelessWidget {
  Favourites({Key? key});
  final box = Hive.box("bookmark");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        backgroundColor: Color.fromARGB(255, 72, 168, 192),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            // padding: EdgeInsets.all(8.0),
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: Colors.white70,
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  child: BookMark(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
