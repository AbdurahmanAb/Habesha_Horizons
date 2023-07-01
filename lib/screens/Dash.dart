import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/location.dart';
import '../widgets/calander.dart';
import '../widgets/Sidebar.dart';
import 'catagories.dart';
import 'places.dart';
import '../screens/Settings.dart';
import '../widgets/BottomNav.dart';
import '../widgets/Recomended.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        drawer: Sidebar(),
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black, size: 32),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 0),
                      child: Row(
                        children: [
                          // Container(

                          //   width: 100,
                          //   height: 100,
                          //   decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       image: DecorationImage(
                          //           fit: BoxFit.fill,
                          //           image: AssetImage('assets/person/8.jpeg'))),
                          // ),
                          CircleAvatar(
                            child: Image.asset("assets/avatar.png"),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Abdu A",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ))
            ]),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            //Location
            children: [
              SizedBox(
                height: 10,
              ),
              Location(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.recommendation,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.viewall))
                ],
              ),
              Recommend(),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  AppLocalizations.of(context)!.otherPlaces,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // const Places(),
              const Catagory()
            ],

            //Recommedation
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}
