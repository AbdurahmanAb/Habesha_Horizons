import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import '../../widgets/BottomNav.dart';

class Forem extends StatefulWidget {
  const Forem({super.key});

  @override
  State<Forem> createState() => _ForemState();
}

class _ForemState extends State<Forem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 233, 233),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text("Share The Love"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Container(
                  height: 200,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 270,
                            child: TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: "Write What You Feel",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w100),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                padding: EdgeInsets.all(4)),
                            child: Icon(Icons.send_time_extension),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              child: Row(
                            children: [
                              Icon(Icons.photo_library),
                              SizedBox(width: 20),
                              Text(
                                "Add photo",
                              ),
                            ],
                          )),
                          GestureDetector(
                              child: Row(
                            children: [
                              Icon(Icons.face_sharp),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Add Felling")
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  margin: EdgeInsets.all(14),
                  padding: EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset("assets/avatar.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Jhon Doe",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Has anyone noticed the beauty of abbay i cant get it out of my head i spedn 4 condcutive days ther and it was amzing time",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.thumb_up_alt_outlined),
                        Icon(Icons.comment_rounded),
                        Icon(Icons.share)
                      ],
                    )
                  ]),
                ),
              ),
              Container(
                width: double.maxFinite,
                color: Colors.white,
                margin: EdgeInsets.all(14),
                padding: EdgeInsets.all(12),
                child: Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              "assets/person/4.jpeg",
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Jane Doe",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/person/4.jpeg",
                        fit: BoxFit.cover,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.blue,
                      ),
                      Icon(Icons.comment_rounded),
                      Icon(Icons.share)
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
