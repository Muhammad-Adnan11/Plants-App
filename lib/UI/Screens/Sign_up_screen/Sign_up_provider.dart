import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signupscreen with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<String?> auth() async {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      User? user = userCredential.user;

      // Check if the user is not null and proceed with storing user details in Firestore
      if (user != null) {
        await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          'name': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'userId': user.uid,
          'role':'user',
        });
        return 'User registered successfully!';
      }
    } catch (e) {
      print(e);
      return 'Error: ${e.toString()}';
    }
    return null;
  }
  String? validation() {
    if (emailController.text.isEmpty) {
      return 'Please Enter Your Email';
    } else if (passwordController.text.isEmpty) {
      return 'Please Enter Your Password';
    }
    return null;
  }
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
