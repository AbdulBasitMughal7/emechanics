import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/customer/screen/Test/ApplicationSubmit.dart';

class MechanicDetailsScreen extends StatefulWidget {
  @override
  _MechanicDetailsScreenState createState() => _MechanicDetailsScreenState();
}

class _MechanicDetailsScreenState extends State<MechanicDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final emailController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  final addressController = TextEditingController();
  final CNICController = TextEditingController();
  // String _name;
  //String _phoneNumber;
  //String _address;
  //String _cnic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body:SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Enter Your Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    controller: NameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                    ),
                    /* validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  }, */
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: mobilePhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                    ),
                    /*  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value;
                  }, */
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter your address',
                    ),
                    maxLines: 2,
                    /* validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value;
                  }, */
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: CNICController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CNIC',
                      hintText: 'Enter your CNIC',
                    ),
                    /*  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your CNIC';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cnic = value;
                  }, */
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('1. Bring your original CNIC with you. \n'
                      '2. An evaluation test will be conducted by our team. \n'
                      '3. You will be notified about your test schedule by our representative. \n'),
                  SizedBox(height: 28),
                  SizedBox(
                    width: double.parse('180'),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text('Submit'),
                        onPressed:
                            () {
                          saveMechanicDetails();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplicationSubmitted()));
                        } /* {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _submitForm();
                      }
                    }, */
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> saveMechanicDetails() async {
    try {
      await FirebaseFirestore.instance.collection('Mechanic').doc(CNICController.text.toString()).set({
        'firstName': NameController.text.toString(),
        'email': emailController.text.toString(),
        'phoneNumber': mobilePhoneController.text.toString(),
        // 'address': addressController.text.toString(),
        'cnic': CNICController.text.toString(),
      });
      print('Mechanic details saved successfully!');
    } catch (e) {
      print('Error saving mechanic details: $e');
    }
  }
}
