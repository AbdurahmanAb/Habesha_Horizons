import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/Recomend.dart';
import '../screens/detail.dart';
import 'package:flutter/cupertino.dart';

import 'BottomNav.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  List Favs = Hive.box('bookmark').values.toList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("bookmark").listenable(),
        builder: (BuildContext context, Box box, Widget? child) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) => buildFavourite(index),
                    itemCount: Favs.length,
                  )));
        });
  }

  Widget buildFavourite(int index) {
    return Favs.contains(Recom[index].id)
        ? Column(
            children: [
              Container(
                height: 150,
                width: double.maxFinite,
                color: Color.fromARGB(255, 214, 214, 214),
                // padding: EdgeInsets.only(top: 8),
                margin: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          Recom[index].Image,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                if (Hive.box("bookmark").get(Recom[index].id) !=
                                    null) {
                                  Hive.box("bookmark").delete(Recom[index].id);
                                } else {
                                  Hive.box("bookmark")
                                      .put(Recom[index].id, Recom[index].id);
                                }
                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Hive.box("bookmark").get(Recom[index].id) ==
                                          Recom[index].id
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: Colors.red,
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              Recom[index].name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.blue,
                          ),
                          Text(
                            Recom[index].location,
                            style: TextStyle(fontSize: 15),
                          ),
                        ]),
                        ElevatedButton(
                            onPressed: () {
                              Hive.box("bookmark").delete(Recom[index].id);
                            },
                            child: Text("Remove")),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        : Text("");
  }
}
