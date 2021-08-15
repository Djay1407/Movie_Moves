import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn= GoogleSignIn();

  GoogleSignInAccount _user;
  GoogleSignInAccount get user=>_user;

  Future<void> googleLogin()async{
    try {final googleUser= await googleSignIn.signIn();
    // debugPrint(googleUser.displayName);
    if(googleUser==null) return;
    _user=googleUser;
    // googleUser.id; 
    final googleAuth= await googleUser.authentication;

    final credential= GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
    }  on PlatformException catch (err) { // Checks for type PlatformException
    if (err.code == 'sign_in_canceled') { // Checks for sign_in_canceled exception
        debugPrint(err.toString());
    } else {
        rethrow; // Throws PlatformException again because it wasn't the one we wanted
    }
}

  }

  Future logout() async {
    // await googleSignIn.disconnect();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

  }
  
}