import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController _passwordController = TextEditingController();

  var passwordCounter;
  TextEditingController get passwordController => _passwordController;
}
