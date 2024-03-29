import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth_Control extends GetxController{

 googleSignIn() async{
   print("Google SignIn called");
    GoogleSignIn _GoogleSignIn = GoogleSignIn();
    try{
      var Result = await _GoogleSignIn.signIn();
      final UserData = await Result?.authentication;
      final Credential = GoogleAuthProvider.credential(
        accessToken: UserData!.accessToken,
        idToken: UserData.idToken
      );
      try{
        var FinalResult = FirebaseAuth.instance.signInWithCredential(Credential);
        Fluttertoast.showToast(msg: "Signed In", backgroundColor: Colors.black, textColor: Colors.white);
      }
      catch(e){
        print(e);
      }
    }
    catch(e){
       print(e);
    }
 update();

  }
}