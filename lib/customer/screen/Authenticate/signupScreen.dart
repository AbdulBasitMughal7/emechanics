import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/customer/screen/Authenticate/loginScreen.dart';
import 'package:untitled5/customer/services/utilis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  bool obscureText=true;
  Utlils utlils=Utlils();
  bool loading= false;
  FirebaseAuth _auth= FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Widget buildname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
            controller: nameController,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.account_box_sharp,
                    color: Color(0xff0b5394),
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
            controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff0b5394),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildPhonenum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
            controller: mobilePhoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xff0b5394),
                  ),
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
              controller:passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff0b5394),
                  ),
                  // suffixIcon: IconButton(
                  //
                  //   icon:Icon(obscureText ? Icons.visibility: Icons.visibility_off,color: Color(0xff0b5394),), onPressed: () {
                  //   setState(() {
                  //     obscureText=!obscureText;
                  //   }); },
                  //
                  // ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 45,
          child: TextField(
            controller: confirmPasswordController,
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff0b5394),
                  ),
                  // suffixIcon: IconButton(
                  //
                  //   icon:Icon(obscureText ? Icons.visibility: Icons.visibility_off,color: Color(0xff0b5394),), onPressed: () {
                  //   setState(() {
                  //     obscureText=!obscureText;
                  //   }); },
                  //
                  // ),

                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        onPressed: () async {
          setState(() {
            loading= true;
          });
           await _auth.createUserWithEmailAndPassword(email: emailController.text.toString(),
            password: passwordController.text.toString()).then((value){
             final users = FirebaseFirestore.instance.collection(_auth.currentUser!.email.toString());

             users.doc("User Information").set({

               'name': nameController.text.toString(),
               'email': emailController.text.toString(),
               'password': passwordController.text.toString(),
               'mobile number':mobilePhoneController.text.toString(),
               'confirm password': confirmPasswordController.text.toString()



             }).then((value) => Utlils().toastMessage('Database Formed')).onError((error, stackTrace) => Utlils().toastMessage(error.toString()));


             utlils.toast(_auth.currentUser!.email.toString());
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => LoginScreen()));
            setState(() {
              loading= false;
            });

          }).onError((error, stackTrace) {

            Utlils().toastMessage(error.toString());
            setState(() {
              loading= false;

            });
          });

          //  users.doc("shahidmustafakhan2@gmail.com").set({
          //
          //   'name': nameController.text.toString(),
          //   'email': emailController.text.toString(),
          //   'password': passwordController.text.toString(),
          //   'mobile number':mobilePhoneController.text.toString(),
          //   'confirm password': confirmPasswordController.text.toString()
          //
          //
          //
          // }).then((value) => Utlils().toastMessage('Database Formed')).onError((error, stackTrace) => Utlils().toastMessage(error.toString()));
          //




    },


        child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.red,):Text(
          'Sign Up',
          style: TextStyle(
              color: Color(0xff0b5394),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have an Account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Log In',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                child: Stack(children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x730b5394),
                      Color(0xA60b5394),
                      Color(0xD90b5394),
                      Color(0xff0b5394),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      buildname(),
                      SizedBox(height: 8),
                      buildEmail(),
                      SizedBox(height: 8),
                      buildPhonenum(),
                      SizedBox(height: 8),
                      buildPassword(),
                      SizedBox(height: 8),
                      buildConfirmPassword(),
                      SizedBox(height: 8),
                      buildSignUpBtn(),
                      buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ]))));
  }
}
