import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/Login_screen.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/login_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/Sign_up_provider.dart';
import 'package:plants_mart/UI/Screens/Sign_up_screen/sign_up_screen.dart';
import 'package:plants_mart/UI/Screens/admain_screen/admain_screen.dart';
import 'package:plants_mart/UI/Screens/admain_screen/admin_screen_provider.dart';
import 'package:plants_mart/UI/Screens/cart_screen/cart_screen.dart';
import 'package:plants_mart/UI/Screens/detail_screen/detail_screen.dart';
import 'package:plants_mart/UI/Screens/otp_screen/otp_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen_provider.dart';
import 'package:plants_mart/UI/splash_screen.dart';
import 'package:plants_mart/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51QBA3hE8CiwahsOtEWT2UTFzTpp72HUYzmynDENCr8ZI0gCF5GceiYAGRv8UL0iz173CoScRxWy77ucWoE1eeBhj00PitgVgT4';
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(ResponsiveSizer(
    builder: (
      BuildContext,
      Orientation,
      ScreenType,
    ) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Productlist()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => Signupscreen()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
