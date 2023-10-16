import 'package:flutter/material.dart';
import 'package:untitled5/main.dart';
import 'package:untitled5/customer/screen/onBoarding/onboarding_page.dart';
import 'package:untitled5/customer/screen/onBoarding/page/button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // title: Text(MyApp.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomePage',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Go Back',
              onClicked: () => goToOnBoarding(context),
            ),
          ],
        )),
      );
  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );
}
