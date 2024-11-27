import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfileProvider with ChangeNotifier {
  User? currentUser;
  final User? _user_id = FirebaseAuth.instance.currentUser;
  User? get user_id => _user_id;
  ProfileProvider() {
    // Listen to changes in FirebaseAuth state and update the currentUser accordingly
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      currentUser = FirebaseAuth.instance.currentUser;
      notifyListeners();
    });
  }

  void logout(BuildContext context) async {
    //final loginProvider = Provider.of<login_provider>(context, listen: false);

    try {
      await FirebaseAuth.instance.signOut().then((value) {
        // Clear user data from the provider
        currentUser = null;
       //loginProvider.email_controller.clear();
        //loginProvider.password_controller.clear();

        // Navigate to login screen
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Login_Screen(),
        //   ),
        // );
        print('Signed out successfully');
      });
    } catch (e) {
      print('Error signing out: $e');
    }
    notifyListeners();
  }
  // Get user's email
  String? get userEmail => currentUser?.email;
  // Get user's display name
  String? get userName => currentUser?.displayName;
}