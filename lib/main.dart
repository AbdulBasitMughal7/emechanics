// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/customer/screen/Authenticate/authenticate.dart';
import 'package:untitled5/customer/screen/Authenticate/loginScreen.dart';
import 'package:untitled5/customer/screen/Authenticate/signupScreen.dart';
import 'package:untitled5/customer/screen/Booking/bookingoption.dart';
import 'package:untitled5/customer/screen/Home/Home.dart';
import 'package:untitled5/customer/screen/onBoarding/home_page.dart';
import 'package:untitled5/customer/screen/onBoarding/onboarding_page.dart';
import 'package:untitled5/customer/screen/stripe/stripe.dart';
import 'package:untitled5/customer/screen/uber/uber%20main.dart';
import 'package:untitled5/customer/screen/Addvehcile/selectvehicle.dart';
// import 'package:untitled5/services/Google%20Map/googlemap.dart';
import 'package:untitled5/customer/screen/tracking%20system/tracking.dart';
import 'package:untitled5/customer/screen/Project/map.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
// import 'package:stripe_payment/home_screen.dart';
import 'package:untitled5/customer/splash screen/splashscreen.dart';
import 'package:untitled5/customer/screen/stripe/stripe.dart';
import 'customer/screen/Addvehcile/addvehicle.dart';
import 'customer/screen/Booking/booking.dart';
import 'customer/screen/Booking/confirmation screen.dart';
import 'customer/screen/Feedback/Feedback.dart';
import 'customer/screen/How E-Mechanic works/HowEMechanicWorks.dart';
import 'customer/screen/Payment/payment.dart';
import 'customer/screen/Test/Acess.dart';
import 'customer/screen/book a service/services.dart';
import 'customer/screen/job.dart';
import 'customer/splash screen/splashscreen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stripe.publishableKey =
      "pk_test_51M2JDRI9g1k2GBYr9VMh3DYNrBPPkU66ddB3QCxZJsllG8eLJt2Pk35qzx5AryXmhM4VVm7wZeUTHiEQNPY2OGE400yF6AiPiW";

  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // ignore: unused_field
  Authenticate _authenticate = Authenticate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          // primarySwatch: Colors.blue,
          ),
      home: const SplashScreen(),
    );
  }
}
