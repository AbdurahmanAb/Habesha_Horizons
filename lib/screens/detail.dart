import 'package:flutter/material.dart';
import '../models/Recomend.dart';
import '../models/Feedback.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/feedback.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final RecommendModel data;

  Detail({required this.data});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Marker marker = Marker(
    markerId: MarkerId('myMarker'),
    position: LatLng(37.7749, -122.4194),
    infoWindow: InfoWindow(title: 'My Marker'),
  );
  int _isSelected = 0;
  var _id;

  String feedback = '';
  final _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var name = widget.data.name;
    _id = widget.data.id;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: Text(widget.data.name),
        backgroundColor: Color.fromARGB(255, 51, 167, 199),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            // bottomRight: Radius.circular(140)
                          ),
                          child: Image.asset(
                            widget.data.Image,
                            height: 350,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40)),
                              child: Container(
                                height: 100,
                                width: 200,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '38 C',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue[300]),
                                      ),
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.amber,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SizedBox(
                      child: Text("About $name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.data.Desc,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Column(
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Distance :-  256KM from Addis'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Temprature :-  75F'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Type :-  Natural Attraction'),
                      ),
                    ],
                  ),
                  Text("feedback"),

                  // ListView.builder(itemBuilder: ,itemCount: ,),

                  SizedBox(
                    height: 400,
                    child: FutureBuilder<List<FeedBack>>(
                      future: feedBackApi.fetchFeedBack(),
                      builder: (context, snapshot) {
                        final feedbacks = snapshot.data;
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          default:
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return Center(
                                child: Text("Something went wrong"),
                              );
                            } else {
                              return buildfeedback(feedbacks);
                            }
                        }
                      },
                    ),
                  ),

                  Text("Your FeedBackHere"),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(5, (index) {
                          return InputChip(
                              onPressed: () {
                                setState(() {
                                  _isSelected = index;
                                });
                              },
                              backgroundColor: _isSelected == index
                                  ? Colors.blue
                                  : Colors.white,
                              padding: EdgeInsets.all(12),
                              label: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: _isSelected == index
                                        ? Colors.white
                                        : Colors.black),
                              ));
                        })),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 18.0, right: 18.0),
                    width: double.maxFinite,
                    child: TextFormField(
                        maxLength: 200,
                        maxLines: 3,
                        controller: _inputController,
                        onChanged: (value) {
                          setState(() {
                            feedback = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: Text(
                              "Write Your Feedback Here",
                              style: TextStyle(),
                            ))),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        sendFeedBack();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 3, right: 3)),
                      child: Text("Send")),
                  SizedBox(
                      width: double.maxFinite,
                      height: 500,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        rotateGesturesEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(8.55, 39.27),
                          zoom: 12,
                        ),
                        markers: Set<Marker>.of([
                          Marker(
                            markerId: MarkerId('myMarker'),
                            position: LatLng(8.55, 39.27),
                            infoWindow: InfoWindow(title: 'Adama'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed),
                          ),
                        ]),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future sendFeedBack() async {
    _inputController.clear();
    if (_isSelected != 0 && feedback != null || feedback != '') {
      print(_isSelected + 1);
      var _user = 5;
      print(feedback);
      print(_id);
      final options = {
        "AttractionID": 21,
        "UserId": _user,
        "ratting": _isSelected + 1,
        "comment": feedback
      };
      final body = jsonEncode(options);
      final url = Uri.parse('http://localhost:8000/controller/Feedback');
      final response = await http
          .post(url, body: body, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        print('Feedback submitted successfully');
      } else {
        print('Error submitting feedback: ${response.statusCode}');
      }
    }
  }
}

Widget buildfeedback(feedback2) => ListView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: 120,
              width: double.maxFinite,
              margin:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 24, right: 24),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 247, 247),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 60,

                    child: CircleAvatar(
                      child: Text(
                        " AB",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage('assets/person/3.jpeg'))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "User $index ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(feedback2[index].comment)
                    ],
                  )
                ],
              ),
            ),
            Positioned(bottom: 14, left: 30, child: Text("2023/05/13")),
            Positioned(
                top: 12,
                right: 35,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 15,
                  child: Text(
                    feedback2[index].ratting.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        );
      },
      itemCount: feedback2.length,
    );
