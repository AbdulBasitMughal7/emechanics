import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/customer/screen/Authenticate/authenticate.dart';
import 'package:untitled5/customer/screen/Home/Home.dart';
import 'package:untitled5/customer/screen/onBoarding/home_page.dart';
import 'package:untitled5/customer/screen/onBoarding/page/button_widget.dart';
import 'package:untitled5/customer/splash%20screen/splashscreen2.dart';

import '../../splash screen/splashscreen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Authenticate authenticate=Authenticate();

  List<PageViewModel> getPages(){
    return [
      PageViewModel(
        title: ' E-Mechanic App',
        body: '"Find mechanic jobs in your area with our app. Join now to grow your business with ease and convenience."',
        image: Lottie.asset('assets/98880-mechanic-animation.json'),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: 'Tracking System',
        body: '"Efficiently manage appointments and track customer locations with our app for mechanics."',
        image: Lottie.asset('assets/106486-woman-tracking-on-phone.json'),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: 'Service',
        body: '"List affordable professional services, grow your mechanic business on our platform."',
        footer: ButtonWidget(
          text: 'Start Exploring',
          onClicked: () => goToHome(context),
        ),
        image:  Lottie.asset('assets/27562-searching-for-profile.json'),
        decoration: getPageDecoration(),
      ),


    ];
  }

  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: getPages(),
      done: Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
      onDone: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>  SplashScreen())),
      showSkipButton: true,
      skip: Text('Skip'),
      onSkip: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>  SplashScreen())),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.black,
      isProgressTap: true,
      isProgress: true,
      showNextButton: true,
      dotsFlex: 1,
      nextFlex: 1,
      animationDuration: 2,
      freeze: false,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => SplashScreen()),
  );


  Widget buildImage(String path) => Center(
    child: Image.asset(path, width: 350),
  );

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    activeColor: Colors.black,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 22),
    // descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}
