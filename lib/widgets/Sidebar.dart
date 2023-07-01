import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:habesha/screens/Drawer/Dictionary.dart';
import '../screens/currency.dart';
import '../screens/Drawer/forem.dart';
import '../screens/Drawer/news.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Color.fromARGB(255, 72, 168, 192),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(CupertinoIcons.news),
            title: Text("News Feed"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => News()));
            },
          ),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text("Translator"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dictionary()));
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.group),
            title: Text("Forem"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Forem())));
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.money_dollar_circle),
            title: Text("Live Currency"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Currency()));
            },
          ),
          SizedBox(
            height: 15,
          ),
          Divider(color: Colors.black54),
          ListTile(
            leading: Icon(CupertinoIcons.question_circle),
            title: Text("FAQ"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
