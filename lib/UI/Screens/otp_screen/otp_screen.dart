import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Verify your',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Phone number',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text('Enter your OTP code here'),
              const SizedBox(
                height: 20,
              ),
              const Pinput(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 40,
                  height: 40,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.green),
                    //borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Verify with Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 100),
                child: Row(
                  children: [
                    Text('Dont receive OTP? '),
                    Text(
                      'Resend',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    )
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
