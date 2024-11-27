import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Components/CostumTextfield.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/login_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/sign_up_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/core/colors.dart';
import 'package:provider/provider.dart';

import '../buttom_navigation_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var heightX = MediaQuery.of(context).size.height;
    var widthX = MediaQuery.of(context).size.width;
    final LoginProvider1 = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightX * 0.14,
              ),
              Container(
                height: heightX * 0.14,
                width: widthX * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0XFF67802f), width: widthX * 0.005),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                  ),
                  //borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 215, top: 30),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: widthX * 0.1, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 130, bottom: 15),
                child: Text('Please sign into continue'),
              ),
              CostumTextfield(
                lableText: 'Email',
                hintText: 'Enter your Email',
                icon: Icons.email,
                // suffix: Icon(Icons.visibility, color: Colors.black),
                controller: LoginProvider1.emailController,
              ),
              CostumTextfield(
                lableText: 'Password',
                hintText: 'Enter your password',
                icon: Icons.lock,
                suffix: const Icon(Icons.visibility, color: Color(0XFF67802f)),
                controller: LoginProvider1.passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220, top: 15),
                child: MaterialButton(
                  onPressed: () {
                    String? validation = LoginProvider1.validation();
                    if (validation != null) {
                      print(validation);
                    } else {
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: LoginProvider1.emailController.text.trim(), password: LoginProvider1.passwordController.text.trim()).then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Buttomnavigation(),
                            ),
                          );
                        },
                      );
                    }
                  },
                  color: const Color(0XFF67802f),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Login'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account? '),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Color(0XFF67802f)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
