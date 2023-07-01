import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habesha/models/User.dart';

import 'screens/Splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './global/State.dart';
// ...

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('bookmark');
  await Hive.openBox('languages');
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>("UserBox");

  runApp(ProviderScope(
    child: MyApp(),
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 72, 168, 192),
    systemNavigationBarColor: Color.fromARGB(255, 72, 168, 192),
  ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(LanguageProvider);
    print(value + "this");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel Ethio',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(value, ''),
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        )),
        home: Material(
          child: SplashScreen(),
        ));
  }
}
