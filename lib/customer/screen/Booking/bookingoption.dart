import 'package:flutter/material.dart';

import '../Payment/PaymentI.dart';
import 'booking.dart';

class MechanicBookingScreen extends StatefulWidget {
  @override
  _MechanicBookingScreenState createState() => _MechanicBookingScreenState();
}

class _MechanicBookingScreenState extends State<MechanicBookingScreen> {
  bool _isInstantHireSelected = true;

  void _handleInstantHireOptionSelected() {
    setState(() {
      _isInstantHireSelected = true;
    });
  }

  void _handleLaterBookingOptionSelected() {
    setState(() {
      _isInstantHireSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Book a Mechanic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your booking option:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: true,
                  groupValue: _isInstantHireSelected,
                  onChanged: (value) {
                    _handleInstantHireOptionSelected();
                  },
                ),
                Text(
                  'Instant Hire',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: false,
                  groupValue: _isInstantHireSelected,
                  onChanged: (value) {
                    _handleLaterBookingOptionSelected();
                  },
                ),
                Text(
                  'Book for Later',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton (
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
              ),
              onPressed: () {
                if (_isInstantHireSelected) {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentI()));
                } else {
                  // Handle later booking
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Booking()));

                }
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
