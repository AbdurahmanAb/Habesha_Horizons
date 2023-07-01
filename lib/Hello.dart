// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Localization Demo',
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         const Locale('en', ''), // English
//         const Locale('es', ''), // Spanish
//         const Locale('ar', ''), // Arabic
//       ],
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Locale? _locale;

//   void _changeLanguage(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Localization Demo'),
//       ),
//       body: Center(
//         child: Text(
//           FlutterLocalizations.of(context).hello,
//           style: TextStyle(fontSize: 32),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return SimpleDialog(
//                 title: Text('Choose a language'),
//                 children: [
//                   SimpleDialogOption(
//                     child: Text('English'),
//                     onPressed: () => _changeLanguage(Locale('en', '')),
//                   ),
//                   SimpleDialogOption(
//                     child: Text('Spanish'),
//                     onPressed: () => _changeLanguage(Locale('es', '')),
//                   ),
//                   SimpleDialogOption(
//                     child: Text('Arabic'),
//                     onPressed: () => _changeLanguage(Locale('ar', '')),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         tooltip: 'Change Language',
//         child: Icon(Icons.language),
//       ),
//     );
//   }
// }



// class Abdu extends StatefulWidget {
//   const Abdu({Key? key}) : super(key: key);
//   @override
//   _AbduState createState() => _AbduState();
// }

// class _AbduState extends State<Abdu> {
//   @override
//   Widget build(BuildContext context) {
//     int _counter = 0;
//     void _add() {
//       return setState(() {
//         _counter++;
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Counter"),
//       ),
//       body: Column(
//         children: [
//           Text('$_counter'),
//           ElevatedButton(onPressed: _add, child: Text("Add"))
//         ],
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text(data.name),
//         backgroundColor: Colors.green[400],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Image.asset(
//               data.Image,
//               height: 250,
//               width: double.maxFinite,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     data.name,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.blue[300]),
//                   ),
//                   Spacer(),
//                   Icon(
//                     CupertinoIcons.star_fill,
//                     color: Colors.amber,
//                   ),
//                   Text(data.star.toString())
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: SizedBox(
//           height: 65,
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 8.0, bottom: 8.0, left: 12, right: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "2,562",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                 ),
//                 SizedBox(
//                   width: 270,
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 8)),
//                       child: Text("Book Now")),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ));
// }
