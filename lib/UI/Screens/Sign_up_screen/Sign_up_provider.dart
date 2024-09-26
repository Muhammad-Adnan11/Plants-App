import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signupscreen with ChangeNotifier {
  User? userId=FirebaseAuth.instance.currentUser;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String? auth() {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then(
        (value) {
          FirebaseFirestore.instance.collection('user').doc(userId!.uid).set(
            {
              'name': username.text.trim(),
              'email': emailController.text.trim(),
              'userId':userId!.uid,
            },
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
  String? validation  (){
    if (emailController.text.isEmpty) {
      return 'Please Enter Your Email';
    }
    else if (passwordController.text.isEmpty) {
      return 'Please Enter Your Password';
    }
    return null;
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
