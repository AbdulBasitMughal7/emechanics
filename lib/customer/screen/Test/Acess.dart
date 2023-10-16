import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/customer/screen/Test/testUI.dart';

import '../Home/Home.dart';

class CheckUserScreen extends StatefulWidget {
  @override
  _CheckUserScreenState createState() => _CheckUserScreenState();
}

class _CheckUserScreenState extends State<CheckUserScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    try {
      // Get the current user's email
      final user = _auth.currentUser;
      final userEmail = user?.email;

      // Check if the user's email is present in the "Allowed" collection
      final snapshot = await _firestore.collection("Allowed").where("email", isEqualTo: userEmail).get();
      if (snapshot.docs.isNotEmpty) {
        // If the user's email is present, navigate to the home screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        // If the user's email is not present, navigate to the mechanic detail screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MechanicDetailsScreen()));
      }
    } catch (error) {
      print("Error checking user: $error");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text("Checking user..."),
      ),
    );
  }
}
