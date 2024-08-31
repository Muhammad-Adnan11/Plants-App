import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/Login_screen.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/login_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/Sign_up_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/sign_up_screen.dart';
import 'package:plants_mart/UI/Screens/cart_screen/cart_screen.dart';
import 'package:plants_mart/UI/Screens/detail_screen/detail_screen.dart';
import 'package:plants_mart/UI/Screens/otp_screen/otp_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen_provider.dart';
import 'package:plants_mart/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Productlist()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => Signupscreen())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CartScreen(),
      ),
    );
  }
}
