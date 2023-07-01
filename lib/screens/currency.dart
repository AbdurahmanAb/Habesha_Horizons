import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habesha/widgets/chart.dart';
import 'package:http/http.dart' as http;

import '../widgets/BottomNav.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  TextEditingController _inputController = TextEditingController();

  int _amount = 0;
  var _result = '';
  var value;
  String _responseText = '';
  var _isClicked = false;
  var _selectedItem;
  var _selectedItem_2;
  List<String> _items = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTN",
    "BWP",
    "BYN",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLP",
    "CNY",
    "COP",
    "CRC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "FOK",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "UAH",
    "UGX",
    "USD",
    "YER",
    "ZAR",
    "ZMW",
    "ZWL"
  ];
  Future<void> _fetchData() async {
    print("From Ftech Data Function");
    try {
      final uri = Uri.https('currency-converter-by-api-ninjas.p.rapidapi.com',
          '/v1/convertcurrency', {
        'have': '$_selectedItem',
        'want': '$_selectedItem_2',
        'amount': '$_amount'
      });

      final headers = {
        'X-RapidAPI-Key': '6ae77d3390mshc0eeb5f629dd97cp1f24e9jsn26dead01431c',
        'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
      };

      final response = await http.get(uri, headers: headers);
      final res = await jsonDecode(response.body);
      value = res["new_amount"];
      print("value is $value");
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          _result = response.body;
        });
      } else {
        _result = "Some Thing Went Wrong, Try Again!";
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      setState(() {
        _responseText = 'Exception: $e';
        _result = "Some Thing Went Wrong, Try Again!";
      });
    }
  }

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Currency"),
          backgroundColor: Color.fromARGB(255, 72, 168, 192),
        ),
        bottomNavigationBar: BottomNav(),
        body: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    // borderRadius: BorderRadius.circular(25), child: Chart()
                    // Container(
                    //   height: 200,
                    //   color: Color.fromARGB(255, 228, 228, 228),
                    //   child: Center(
                    //       child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Text(
                    //         " \$1 ~ 55.45 ETB ",
                    //         style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 26,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       Text(
                    //         " \$1 ~ 55.45 ETB ",
                    //         style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 26,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       Text(
                    //         " \$1 ~ 55.45 ETB ",
                    //         style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 26,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       Text(
                    //         " 1EUR ~ 55.45 ETB ",
                    //         style: TextStyle(
                    //             color: Colors.blue,
                    //             fontSize: 26,
                    //             fontWeight: FontWeight.bold),
                    //       )
                    //     ],
                    //   )),
                    // ),
                    ),
                SizedBox(
                  height: 20,
                ),
                Text("Currency Converter",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        child: DropdownButtonFormField<String>(
                          elevation: 4,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          value: _selectedItem,
                          hint: Text('From'),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                          items: _items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          value: _selectedItem_2,
                          hint: Text('To'),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem_2 = newValue;
                            });
                          },
                          items: _items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 210,
                  child: Center(
                    child: TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      onChanged: (_inputController) {
                        setState(() {
                          _amount = int.parse(_inputController);
                        });
                      },
                      decoration: InputDecoration(
                          label: Text("Enter The Amount"),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      _fetchData();
                      setState(await () {
                        _isClicked = true;
                      });
                    },
                    child: Text("Convert")),
                Column(
                  children: [
                    _amount > 0 &&
                            _selectedItem != null &&
                            _selectedItem_2 != null &&
                            _isClicked
                        ? Container(
                            margin: EdgeInsets.all(10),
                            height: 100,
                            child: Text(
                                "$_amount $_selectedItem  is $value  $_selectedItem_2 "),
                          )
                        : Text("")
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
