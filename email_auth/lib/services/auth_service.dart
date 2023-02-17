import 'package:firebase_auth/firebase_auth.dart';

//as we are using Firebase for Authentication, we have pre-built methods for login and register.

class AuthService {
  static Future<String> registration({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password:
              password); //or register, we can use createUserWithEmailAndPassword and it takes 2 parameters i.e. email and password.
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message!;
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password); //use signInWithEmailAndPassword which also takes 2 parameters i.e. email and password
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message!;
      }
    } catch (e) {
      return e.toString();
    }
  }
}

//Here, we created two user-defined methods to handle our Firebase calls. These methods take email and password as the parameters and pass them to the Firebase functions.
//Let's call Functions from the UI now