import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Dash.dart';
import '../models/User.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../helpers/GoogleSignIn.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 153, 191, 206),
            ],
          ),
        ),
        child: SafeArea(
            child: Center(
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    "assets/hab.png",
                    width: 200,
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Explore Land Of Origin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Affordable And Easy Price ,lorem ipsum deoler eti with breeaty writen adoption wlaking",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              // signInWithGoogle();
                              Signin();
                              // Navigator.push(
                              //     coflutttntext,
                              //     MaterialPageRoute(
                              //         builder: (context) => Dash()));
                            },
                            icon: Image.asset(
                              "assets/g.png",
                              width: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 120, 221, 165),
                                elevation: 0,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 8)),
                            label: Text(AppLocalizations.of(context)!.siginW))),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      label: Text("Continue As A Guest"),
                      onPressed: () {
                        logout();
                      },
                      icon: Icon(Icons.person),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 120, 221, 165),
                          elevation: 0,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 18)),
                    ),
                  )
                ],
              )),
        )),
      ),
    );
  }
}

//   signInWithGoogle() async {
//     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     print(userCredential.user?.displayName);
//     print("User, User, User");
//   }
// }
final box = Hive.box<User>("UserBox");
Future Signin() async {
  try {
    final user = await GooglesignInApi.login();
    final name = user!.displayName.toString();
    final email = user.email.toString();
    final photoUrl = user.photoUrl.toString();
    if (box.get(email) == null) {
      box.put(email, User(Email: email, Username: name, image_url: photoUrl));
    } else {
      print("Lready logged in");
    }
  } catch (Exception) {
    print(Exception);
  }
}

Future logout() async {
  final logout = GooglesignInApi.logout();

  print("logged out");
}
