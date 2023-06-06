//import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:my_app/apicalling/home_page.dart';
import 'package:my_app/firebase/screen/login_screen.dart';
import 'package:my_app/state_management/provider/sige_in_provider.dart';
//import 'package:my_app/firebase_services/splash_services.dart';
import 'package:provider/provider.dart';

import '../../utils/next_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
         ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const HomeScreen());
    });
    // splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/image/app_start.png",
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}
