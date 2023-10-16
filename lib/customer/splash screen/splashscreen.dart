import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../screen/Authenticate/authenticate.dart';
import '../screen/Home/Home.dart';
import '../screen/cart/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Authenticate _authenticate=Authenticate();
  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          AnimatedSplashScreen(
          splash: Lottie.asset('assets/80561-smooth-gears-ignite-animation.json',
          reverse: true,
          repeat: true),
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
          nextScreen: _authenticate.isLogin(),
          splashIconSize: 250,
          duration: 3000,
          // splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          animationDuration: const Duration(seconds:3),
        ),
          // Positioned(
          //   top: MediaQuery.of(context).size.height*0.8,
          //   left: 0,
          //   right: 0,
          //   child: Text(
          //     'E-Mechanic',
          //     style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
      ]
  ),
    );
  }
}

