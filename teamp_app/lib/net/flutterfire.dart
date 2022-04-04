import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



Future <bool>  signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    String? message = 'Incorrect email or password, please check your credentials';
      if (e.message != null){
        message = e.message;
        print (message);
        //showSnackBar();
      }
  // Scaffold.of(context)

     return false;
    }
  catch (e) {
    print(e);//.toString());    //errors.add("User does not exist, Please Sign Up");
    return false;
  }
  
}
  // showSnackBar(String snackBarText, Duration d){
  //   final snackBar = SnackBar(content: Text(snackBarText), duration: d,);
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

Future <bool>  signUp(String email, String password, String confirmPassword) async {
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password'){
      print('The password provided is too weak');
    } else if(e.code == 'email-already-in-use'){
      print('The email is already registered under an account');
      }
      return false;
    } catch (e){
      print(e.toString());
    return false;
  }
}
