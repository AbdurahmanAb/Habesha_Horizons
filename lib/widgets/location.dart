import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var min = "";
    if (now.minute < 10) {
      min = "0" + now.minute.toString();
    } else {
      min = now.minute.toString();
    }
    String Time = now.hour.toString() + " : " + min + "  " + now.timeZoneName;

    var currentHour = now.hour;
    String Greeting;
    if (currentHour >= 5 && currentHour < 12) {
      Greeting = 'Good morning Fellas';
    } else if (currentHour >= 12 && currentHour < 18) {
      Greeting = 'Good afternoon Fellas';
    } else if (currentHour >= 18 && currentHour < 24) {
      Greeting = 'Good evening Fellas';
    } else {
      Greeting = 'Good midnight Fellas';
    }

    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Image.asset(
              "assets/world2.png",
              width: 120,
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.goodMorning,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.time_solid,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(Time),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
