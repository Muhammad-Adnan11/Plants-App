import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController _passwordController = TextEditingController();
  //var passwordCounter;
  TextEditingController get passwordController => _passwordController;
  @override
  String? validation  (){
    if (emailController.text.isEmpty) {
      return 'Please Enter Your Email';
    }
    else if (passwordController.text.isEmpty) {
      return 'Please Enter Your Password';
    }
    return null;
  }
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }


  void clearFields(){
    _emailController.clear();
    _passwordController.clear();
    notifyListeners();
  }
}
