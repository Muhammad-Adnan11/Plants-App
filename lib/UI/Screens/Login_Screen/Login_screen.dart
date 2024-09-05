import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Components/CostumTextfield.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/login_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/sign_up_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/core/colors.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final LoginProvider1 = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 1.9),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                  ),
                  //borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 215, top: 30),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 130, bottom: 15),
                child: Text('Please sign into continue'),
              ),
              CostumTextfield(
                lableText: 'Email',
                hintText: 'Enter your Email',
                icon: Icons.email,
                suffix: Icon(Icons.visibility, color: Colors.black),
                controller: LoginProvider1.emailController,
              ),
              CostumTextfield(
                lableText: 'Password',
                hintText: 'Enter your password',
                icon: Icons.lock,
                controller: LoginProvider1.passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220, top: 15),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: (){ Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductScreen(),
                            ),
                          );},
                          child : Text('Login')),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account? '),
                    InkWell(
                        onTap: () {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: LoginProvider1.emailController.text.trim(),
                            password: LoginProvider1.passwordController.text
                                .trim(),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUpScreen(),
                            ),
                          );
                        },

                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.green),
                        )),
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
