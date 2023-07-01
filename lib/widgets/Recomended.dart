import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../screens/detail.dart';
import '../models/Recomend.dart';
import 'package:flutter/cupertino.dart';

class Recommend extends StatelessWidget {
  Recommend({super.key});

  final _box = Hive.box("bookmark");
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("bookmark").listenable(),
        builder: (BuildContext context, Box box, Widget? child) {
          return SizedBox(
            height: 370,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              data: Recom[index],
                            ),
                          ));
                    },
                    child: SizedBox(
                      width: 230,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    Recom[index].Image,
                                    height: 250,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    right: 2,
                                    top: 6,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_box.get(Recom[index].id) != null) {
                                          _box.delete(Recom[index].id);
                                        } else {
                                          _box.put(
                                              Recom[index].id, Recom[index].id);
                                        }
                                        // print(_box.values.toList());
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Icon(
                                            _box.containsKey(Recom[index].id)
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color: Colors.redAccent,
                                          )),
                                    ))
                              ]),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Recom[index].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue[300]),
                                    ),
                                    Spacer(),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(Recom[index].star.toString())
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.location_solid,
                                    color: Colors.blue[300],
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(Recom[index].location),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                itemCount: Recom.length),
          );
        });
  }
}
