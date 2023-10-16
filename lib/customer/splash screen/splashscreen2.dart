import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/customer/screen/Project/map.dart';
import 'package:untitled5/customer/screen/stripe/stripe.dart';
import 'package:untitled5/customer/screen/tracking%20system/tracking.dart';

import '../screen/Authenticate/authenticate.dart';
import '../screen/Home/Home.dart';
import '../screen/cart/home.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  Authenticate _authenticate=Authenticate();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/89437-location-loading.json',
         ),
      // Column(
      //   children: [
      //     Image.asset('assets/emechanic.png'),
      //     const Text(
      //       'E-Mechanic',
      //       style: TextStyle(
      //           fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      //     )
      //   ],
      // ),
      backgroundColor: Colors.white,
      nextScreen: NavigationScreen(),
      splashIconSize: 250,
      duration: 3000,
      // splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds:3),
    );
  }
}

