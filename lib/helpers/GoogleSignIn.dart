import 'package:google_sign_in/google_sign_in.dart';

class GooglesignInApi {
  static final _ggogleSignin = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() {
    return _ggogleSignin.signIn();
  }

  static Future logout() {
    return _ggogleSignin.disconnect();
  }
}
