import 'package:firebase_auth/firebase_auth.dart';

class AuthClass 
{
  var fireAuth = FirebaseAuth.instance;
  signUp(email,password)async{
  await  fireAuth.createUserWithEmailAndPassword(email: email, password: password);
  await fireAuth.currentUser.sendEmailVerification();
  }
}