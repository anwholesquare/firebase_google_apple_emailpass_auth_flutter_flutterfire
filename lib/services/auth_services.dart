import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  signInWithGoogle () async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if (user == null) return; 
    final GoogleSignInAuthentication auth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
     
  }

}