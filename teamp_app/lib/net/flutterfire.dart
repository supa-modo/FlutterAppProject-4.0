
import 'package:firebase_auth/firebase_auth.dart';

Future <bool>  signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
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
