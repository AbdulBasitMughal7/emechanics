import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/customer/screen/Booking/booking.dart';
import 'package:untitled5/customer/screen/Booking/bookingoption.dart';

import '../../services/utilis.dart';
import '../Authenticate/loginScreen.dart';



class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  int id= 1;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final users = FirebaseFirestore.instance.collection(_auth.currentUser!.email.toString());
    users.doc("Services").set({
    });

  }
  Widget build(BuildContext context) {
    final users = FirebaseFirestore.instance.collection(_auth.currentUser!.email.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              _auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));},
            icon: Icon(Icons.logout_outlined, color: Colors.white,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: size.width,
                  padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900
                  ),
                  child: const Center(
                    child: Text("Which Service do you need?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 42
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: size.width,
                  bottom: -45,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.white
                                )
                            ),
                            hintText: "Search for services",
                            prefixIcon: Icon(Icons.search, color: Colors.grey.shade700,)
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
                  width: size.width*0.45,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade700
                  ),
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.screwdriverWrench, color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(height: 20,),
                      Text("Repair & maintainance services",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w400,

                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
                  width: size.width*0.45,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade700
                  ),
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.diagnoses, color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(height: 20,),
                      Text("Help me diagnose my car",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w400,

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("or pick one of the most common services",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Change oil and Filter",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,

                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (1)": "Change oil and Filter"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));

                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Brake Pads Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (2)": "Brake Pads Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Check Engine Light is on (inspection)",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (3)": "Check Engine Light is on(inspection)"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Car is not starting (inspection)",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (4)": "Car is not Starting"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Pre-purchase Car Inspection",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (5)": "Pre-purchase Car Inspection"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Timing Belt Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (6)": "Timing Belt Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Air Filter Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (7)": "Air Filter Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Starter Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (8)": "Starter Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Spark plugs Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required ($id)": "Spark plug Replacement"

                                });
                              },
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (9)": "Spark plug Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Valve Cover Gasket Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (10)": "Value Cover Gasket Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Alternator Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (11)": "Alternator Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));

                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Battery Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (12)": "Battery Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey
                    )
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.6,
                    child: Text("Brake Rotor/Disc Replacement",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.8
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width*0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text("i",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700
                            ),
                            child:  TextButton(
                              onPressed: (){
                                users.doc("Services").update({
                                  "Service Required (13)": "Brake Rotor/ Disc Replacement"

                                }).then((value) => Utlils().toastMessage("Service added to your cart"));
                              },
                              child: Text("ADD",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Booking() ));
                    // users.doc("Services").update({
                    //   "Service Required (13)": "Brake Rotor/ Disc Replacement"
                    // }).then((value) => Utlils().toastMessage("Service added to your cart"));
                  },
                  child: Text("Booking",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ) ,
              // child: Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: size.width*0.6,
              //       child: Text("Brake Rotor/Disc Replacement",
              //         style: TextStyle(
              //             fontSize: 26,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.grey.shade700,
              //             letterSpacing: 1.8
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.topRight,
              //       child: Container(
              //         width: size.width*0.3,
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               height: 40,
              //               width: 40,
              //               decoration:BoxDecoration(
              //                   color: Colors.grey.shade100,
              //                   border: Border.all(color: Colors.grey.shade300)
              //               ),
              //               child: TextButton(
              //                 onPressed: null,
              //                 child: Text("i",
              //                   style: TextStyle(
              //                       fontStyle: FontStyle.italic,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.grey.shade700,
              //                       fontSize: 18
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(width: 15,),
              //             Container(
              //               height: 40,
              //               decoration: BoxDecoration(
              //                   color: Colors.blue.shade700
              //               ),
              //               child:  TextButton(
              //                 onPressed: (){
              //                   users.doc("Services").update({
              //                     "Service Required (13)": "Brake Rotor/ Disc Replacement"
              //
              //                   }).then((value) => Utlils().toastMessage("Service added to your cart"));
              //                 },
              //                 child: Text("ADD",
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w500,
              //                       color: Colors.white
              //                   ),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              color: Colors.grey.shade200,
              child: Text("Didn't find what you need? Click here to describe your services.",
                style: TextStyle(
                    fontSize: 26,
                    letterSpacing: 1.7,
                    color: Colors.grey.shade700
                ),
              ),
            ),
            Container(
              height: 150,
              width: size.width,
              color: Colors.grey.shade900,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width:size.width*0.8,
                    child: const Text("\u00a9 2022 E-Mechanic All rights reserved",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
