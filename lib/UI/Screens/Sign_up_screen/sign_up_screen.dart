import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Components/CostumTextfield.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/Login_screen.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/Sign_up_provider.dart';
import 'package:provider/provider.dart';

import '../product_screen/product_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var wigth = MediaQuery.of(context).size.width;
    final Signup = Provider.of<Signupscreen>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 7,
                ),
                child: Container(
                  width: wigth * 0.5,
                  height: height * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Colors.green, width: wigth * 0.005),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.jpeg'),
                    ),
                  ),
                ),
              ),
              Text(
                'Create Account',
                style: TextStyle(
                    fontSize: wigth * 0.1, fontWeight: FontWeight.bold),
              ),
              CostumTextfield(
                  lableText: 'Name',
                  hintText: 'Enter your name',
                  icon: Icons.man_2_sharp,
                  controller: Signup.username),
              CostumTextfield(
                  lableText: 'Email',
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  controller: Signup.emailController),
              CostumTextfield(
                  lableText: 'Password',
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  controller: Signup.passwordController),
              CostumTextfield(
                  lableText: 'Confirm',
                  hintText: 'Confirm password',
                  icon: Icons.lock,
                  controller: Signup.confirmpassword),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 180),
                child: MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    String? validation = Signup.validation();
                    if (validation != null) {
                      print(validation);
                    } else {
                      Signup.auth();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductScreen(),
                        ),
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('SIGN UP'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginView(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.green),
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
