import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/Settings.dart';
import '../screens/favourites.dart';
import '../widgets/bookmarks.dart';
import '../screens/Dash.dart';
import 'calander.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dash()));
                break;
              case 1:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Favourites()));
                break;
              case 2:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Calander()));
                break;
              case 3:
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Settings()));
                break;
              default:
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
                backgroundColor: Color.fromARGB(255, 72, 168, 192)),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              label: "BookMark",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar),
              label: "Date",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setings",
            ),
          ]),
    );
  }
}
