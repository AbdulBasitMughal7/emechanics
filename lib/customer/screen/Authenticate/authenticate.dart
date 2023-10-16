import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/customer/screen/Authenticate/loginScreen.dart';
import 'package:untitled5/customer/screen/Home/Home.dart';
import 'package:untitled5/customer/screen/Addvehcile/addvehicle.dart';

import '../Test/Acess.dart';

class Authenticate {
  final auth = FirebaseAuth.instance;

  isLogin() {
    if (auth.currentUser != null) {
      return const CheckUserScreen();
    } else {
      return const LoginScreen();
    }
  }
}
