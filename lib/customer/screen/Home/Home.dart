
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/customer/screen/Authenticate/authenticate.dart';
import 'package:untitled5/customer/screen/Authenticate/loginScreen.dart';
import 'package:untitled5/customer/screen/Faq/faq.dart';
import 'package:untitled5/customer/screen/How%20E-Mechanic%20works/HowEMechanicWorks.dart';
import 'package:untitled5/customer/screen/Payment/payment.dart';
import 'dart:math' as math;
import 'package:untitled5/customer/screen/book%20a%20service/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled5/customer/screen/Addvehcile/addvehicle.dart';
import 'package:untitled5/customer/screen/job.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth=FirebaseAuth.instance;
  int _selectedIndex=0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  // final List<Widget> _Screen=[
  //   Home(),
  //   Addvehicle(),
  //   Services()
  // ];
  //
  // void _onItemTapped(int index){
  //
  //   setState(() {
  //     _selectedIndex= index;
  //   });
  // }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          // currentIndex: _selectedIndex,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),

            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work),
              label: "Jobs"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.personal_injury_outlined,),
              label: "Advisor"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded,),
              label: "Account"
          )
        ],
          onTap: (index){
            _selectedIndex=index;
            if(index==1)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> JobListScreen()));
              }
            if(index==2)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQScreen()));
              }
          }

        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Home", style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),),
          ),
          actions: [
          // Padding(
          //   padding:  EdgeInsets.only(right: 4.0),
          //   child: IconButton(onPressed:(){
          //    auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));
          //     },
          //    icon: Icon(Icons.logout_outlined),),
          // ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: (){auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));},
                    icon: Icon(Icons.logout_outlined,
                size: 40,
                color: Colors.blue,
              )),
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   // height: 40, width: 200,
            //   // height: 20,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //     border: Border.all(
            //       color: Colors.blue,
            //       width: 2
            //     )
            //   ),
            //   child:Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: const [
            //       FaIcon(FontAwesomeIcons.gift, color: Colors.blue,size: 20,),
            //       Text("  Get \$20", style: TextStyle(
            //         color: Colors.blue,
            //         fontSize: 20
            //       ),),
            //     ],
            //
            //   ),
            // )
          ],
        ),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.blue.shade700,
            onPressed:() =>Navigator.push(context, MaterialPageRoute(builder: (context)=> JobListScreen())),
            child: FaIcon(FontAwesomeIcons.wrench, color: Colors.white,
              size: 35,
            ),
          ),
        ),
      body:Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MediumSizedBox(),



            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQScreen() ));
              },
                  child: Card(
                    elevation: 0,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade500,
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20, bottom: 30),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Have Any Questions", style: TextStyle(
                                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500
                              ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          const MediumSizedBox(),
                          ListTile(
                            leading: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("assets/person.jpg"),
                            ),
                            title: Text("I can connect you to one of our helpful advisors.",
                              style: TextStyle(fontSize: 28,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: const FaIcon(FontAwesomeIcons.phone, color: Colors.blue,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const MediumSizedBox(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Getting Started", style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    fontSize: 24
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> JobListScreen() ));
                  },
                  child: Card(
                    elevation: 0,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey.shade500,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Search Job", style: TextStyle(
                                  color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500
                              ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          const MediumSizedBox(),
                          ListTile(
                            title: Text("Search for available mechanic jobs and connect with customers in your area.",
                              style: TextStyle(fontSize: 28,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: const FaIcon(FontAwesomeIcons.wrench, color: Colors.blue,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const MediumSizedBox(),
                GestureDetector(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Payment() ));
                    },
                  child: Card(
                    elevation: 0,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey.shade500,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add Payment Details", style: TextStyle(
                                  color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500
                              ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          const MediumSizedBox(),
                          ListTile(
                            title: Text("Effortlessly manage payments with our mechanic module's tools.",
                              style: TextStyle(fontSize: 27,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: const FaIcon(FontAwesomeIcons.creditCard, color: Colors.blue,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const MediumSizedBox(),
                Card(
                  elevation: 0,
                  // margin: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.grey.shade500,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                    child: Column(
                      children:  [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Your Profile is 33% Complete", style: TextStyle(
                                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500
                            ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        // const MediumSizedBox(),
                        Transform(alignment: Alignment.center,transform: Matrix4.rotationY(math.pi),child: const FaIcon(FontAwesomeIcons.gaugeHigh, size: 70,)),
                        const MediumSizedBox(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.blue
                            )
                          ),
                          child: const TextButton(onPressed: null, child: Text("ADD SERVICE LOCATION",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24
                            ),
                          )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.blue
                              )
                          ),
                          child: const TextButton(onPressed: null, child: Text("ADD PAYMENT MEETHOD",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                const MediumSizedBox(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HowItWorksScreen() ));
                  },
                  child: Card(
                    elevation: 0,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey.shade500,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "How E-Mechanic Works", style: TextStyle(
                                  color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500
                              ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          const MediumSizedBox(),
                          ListTile(
                            title: Text("Learn about the easiest way to keep your vehicle running like.",
                              style: TextStyle(fontSize: 27,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
class MediumSizedBox extends StatelessWidget {
  const MediumSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
