import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:untitled5/customer/screen/cart/home.dart';
import 'package:untitled5/customer/screen/book%20a%20service/servicesI.dart';
import 'package:untitled5/customer/screen/stripe/stripe.dart';

import '../Addvehcile/addvehicle.dart';
import '../Payment/payment.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);
  @override
  BookingState createState() => BookingState();
}

class BookingState extends State<Booking> {
  bool isTimeSelected = false; //to check whether the time is selected or not
  bool isDateSelected = false; //to check whether the date is selected or not
  bool dataselected= false;
  FirebaseAuth _auth= FirebaseAuth.instance;
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime currentDate = DateTime.now();
  final TextEditingController _textController = TextEditingController();
  late final DocumentSnapshot document;
   late final data;
   late final DocumentSnapshot document1;
   late final Map<String, dynamic> data1;
   late final List<String> d;
  bool carSelected= false;
  bool vehicleSelected= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    func();
    func1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Booking'),
      // ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.timer),
              trailing: const Icon(Icons.edit),
              title: isTimeSelected
                  // ignore: unnecessary_string_interpolations
                  ? Text('${currentTime.format(context).toString()}')
                  : const Text('Select your time'),
              onTap: () {
                selectTime(context);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_today_rounded),
              trailing: const Icon(Icons.edit),
              title: isDateSelected
                  ? Text(DateFormat('EEE, M/d/y').format(currentDate))
                  : const Text('Select your date'),
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(Icons.car_repair),
              trailing: Icon(Icons.edit),
              title: vehicleSelected
                  ? Text('${data1.values}')
                  : const Text('Select your service'),
              // dataselected
              //     ? Text('${data}')
              //     : const Text('Select your service'),

              onTap: ()  {
                 //  document = await FirebaseFirestore.instance.collection('collectionName').doc('documentId').get();
                 // data = document.data();
                 // dataSelected=


                Navigator.push(context, MaterialPageRoute(builder: (context)=> Services()));

              },
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(Icons.car_crash),
              trailing: Icon(Icons.edit),
              title: carSelected
              ? Text('${data['Make'] +'  '+ data['Model'] + '  '+  data['Year']}')
              : const Text('Select your vehicle'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> addvehicle()));

              },
            ),
          ),
          //
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               // (_textController.value.text.isEmpty)
               //      ? const Text('PLEASE ENTER DESCRIPTION HERE')
               //      : Text("Submitted: ${_textController.value.text}"),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _textController,
                      minLines: 2,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: 'Enter Description here',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                    )),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      _textController.notifyListeners();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Payment() ));
                      Booking();

                    });
                  },
                  child: const Text('Submitted'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        // initial value of the time
        initialTime: currentTime,
        // clock input type
        initialEntryMode: TimePickerEntryMode.inputOnly,
        helpText: 'Choose your time',
        confirmText: 'Choose Now',
        cancelText: 'Later');

    if (pickedTime != null && pickedTime != currentTime) {
      setState(() {
        currentTime = pickedTime;
        isTimeSelected = true;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      helpText: 'Choose your Date',
      confirmText: 'Choose Now',
      cancelText: 'Later',
    );

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        isDateSelected = true;
      });
    }
  }

/*Widget buildMultiTextFieldLine(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (_textController.value.text.isEmpty)
            ? const Text('PLEASE ENTER DESCRIPTION HERE')
            : Text("Submitted: ${_textController.value.text}"),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _textController,
              minLines: 2,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  hintText: 'Enter Description here',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
            )),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              _textController.notifyListeners();
            });
          },
          child: const Text('Submitted'),
        ),
      ],
    );
  }
}*/
Future func() async {
   document = await FirebaseFirestore.instance.collection('akshay123@gmail.com').doc('Vehicle Information').get();
   data = document.data();
   if(data==null || data.toString()=="{}"){
     setState(() {
       carSelected=false;
     });
   }
   else{
     setState(() {
       carSelected= true;
     });
   }

}Future func1() async {
   document1 = await FirebaseFirestore.instance.collection('akshay123@gmail.com').doc('Services').get();
   data1 = document1.data() as Map<String, dynamic>;


   if(data1==null || data1.toString()=="{}"){
     setState(() {
       vehicleSelected=false;
     });
   }
   else{
     setState(() {
       vehicleSelected= true;

     });
   }


}
// Future Booking() async{
//   // document1 = await FirebaseFirestore.instance.collection('akshay123@gmail.com').doc('User Information').get();
//   // data1 = document1.data() as Map<String, dynamic>;
//   final userDoc = await FirebaseFirestore.instance.collection(_auth.currentUser!.email.toString()).doc('User Information').get();
//   final vehDoc = await FirebaseFirestore.instance.collection(_auth.currentUser!.email.toString()).doc('Vehicle Information').get();
//   final userName = userDoc.get('name');
//   final mobileNumber = userDoc.get('mobile number');
//   final model = vehDoc.get('Model');
//
//   final bookingDoc = FirebaseFirestore.instance.collection('jobs').doc((_auth.currentUser!.email.toString()));
//   bookingDoc.set({'name': userName});
//   bookingDoc.update({'mobile number': mobileNumber});
//   bookingDoc.update({'Model': model});
//
//
// }
}
