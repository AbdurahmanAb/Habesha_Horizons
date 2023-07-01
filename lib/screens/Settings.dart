import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import '../helpers/languages.dart';
import '../global/State.dart';
import '../widgets/BottomNav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Settings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account"),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 72, 168, 192),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: DropdownButton<Languages>(
              icon: Icon(Icons.language),
              underline: SizedBox(),
              iconEnabledColor: Colors.white,
              items: country
                  .map<DropdownMenuItem<Languages>>((e) =>
                      DropdownMenuItem<Languages>(
                          value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (Languages? value) {
                ref.read(LanguageProvider.notifier).state = value!.name;
                Hive.box('languages').put('name', value.name);
                var opt = Hive.box("languages").get('name');
                print(opt);
                print(ref.watch(LanguageProvider));
                print("object");
              },
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                width: double.maxFinite,
                child: Row(children: [
                  Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/person/3.jpeg'))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Abdurahman Abdela",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.travelandKnow,
                        style: TextStyle(
                            color: Color.fromARGB(255, 128, 127, 125)),
                      )
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.privacy_tip)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.language)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Language",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showAboutDialog(context: context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.app_blocking_rounded)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "About The App",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.developer_mode)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Developers",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.logout_outlined)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomNav(),
    );
  }
}
