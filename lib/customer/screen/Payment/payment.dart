// import 'package:e_commerce/constant.dart';
// import 'package:e_commerce/notification/components/defaultAppBar.dart';
// import 'package:e_commerce/notification/components/defaultBackButton.dart';
// import 'package:e_commerce/signup/components/defaultButton.dart';
// import 'package:e_commerce/success/success.dart';
// import 'package:e_commerce/widgets/headerLabel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:untitled5/customer/screen/Booking/bookingoption.dart';
import 'package:untitled5/customer/screen/Booking/confirmation%20screen.dart';
import 'package:untitled5/customer/screen/Home/Home.dart';
import 'package:untitled5/customer/screen/stripe/stripe.dart';
import 'package:untitled5/customer/screen/a.dart';
import 'package:untitled5/customer/splash%20screen/splashscreen2.dart';

import '../Authenticate/loginScreen.dart';

class Payment extends StatefulWidget {
  // Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  FirebaseAuth auth=FirebaseAuth.instance;

  a c=a();
  int value = 0;
  List paymentLabels=[
    "Cash on delivery",
    "Stripe"];
    List paymentIcons=[
    Icons.money_off,
    Icons.account_balance_wallet_rounded];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        leading: const CircleAvatar(
          radius: 42,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/person.jpg"),
          ),
        ),
        title: const Text("E-Mechanic", style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        actions:  [
          IconButton(
          onPressed: (){
              auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));},
              icon: Icon(Icons.logout_outlined, color: Colors.white,),
          ) ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Choose your  payment method',
            style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),


            ),),

          // HeaderLabel(
          //   headerText: 'Choose your payment method',
          // ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: Colors.black,
                    value: index,
                    groupValue: value,
                    onChanged: (i) { setState(() => value = i!);
                      if (i==1)
                        {c.makePayment(context);}
                    },
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(paymentIcons[index], color: Colors.black),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
    Container(
    width: size.width,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: const BoxDecoration(
    color: Colors.white,
    // border: Border(
    //     top: BorderSide(
    //         width: 1,
    //         color: Colors.grey
    //     )
    // ),
    ),
    child:  Container(
    height: 40,
    decoration: BoxDecoration(
    color: Colors.blue.shade700
    ),
    child:  TextButton(
    onPressed: (){
      Booking();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmationScreen() ));
    // users.doc("Services").update({
    //   "Service Required (13)": "Brake Rotor/ Disc Replacement"
    // }).then((value) => Utlils().toastMessage("Service added to your cart"));
    },
    child: Text("SAVE",
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white
    ),
    ),
    ),
    ) ,
    ),
          // ElevatedButton(
          //   // text: 'Pay',
          //   style: ElevatedButton.styleFrom(
          //
          //
          //   ),
          //   onPressed: () =>   Navigator.push(context, MaterialPageRoute(builder: (context)=>   SplashScreen2())),
          //
          //   //     Navigator.of(context).push(
          //   //   MaterialPageRoute(
          //   //     builder: (context) => HomeScreen(),
          //   //   ),
          //   child: Text('pay'),
          // ),
        ],
      ),
    );
  }
  Future Booking() async{
    // document1 = await FirebaseFirestore.instance.collection('akshay123@gmail.com').doc('User Information').get();
    // data1 = document1.data() as Map<String, dynamic>;
    final userDoc = await FirebaseFirestore.instance.collection(auth.currentUser!.email.toString()).doc('User Information').get();
    final vehDoc = await FirebaseFirestore.instance.collection(auth.currentUser!.email.toString()).doc('Vehicle Information').get();
    final userName = userDoc.get('name');
    final mobileNumber = userDoc.get('mobile number');
    final model = vehDoc.get('Model');

    final bookingDoc = FirebaseFirestore.instance.collection('jobs').doc((auth.currentUser!.email.toString()));
    bookingDoc.set({'name': userName});
    bookingDoc.update({'mobile number': mobileNumber});
    bookingDoc.update({'Model': model});


  }
}