import 'package:flutter/material.dart';


class HowItWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How E-Mechanics Works',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildStep(
              'Step 1',
              'Book a Service',
              'Use our app to book a service for your vehicle.',
              Icons.car_rental,
              Colors.green,
            ),
            _buildStep(
              'Step 2',
              'Choose a Time',
              'Select a time that is convenient for you.',
              Icons.access_time,
              Colors.blue,
            ),
            _buildStep(
              'Step 3',
              'Mechanic Arrives',
              'A certified mechanic will arrive at your doorstep to service your vehicle.',
              Icons.build,
              Colors.orange,
            ),
            _buildStep(
              'Step 4',
              'Pay and Review',
              'After the service is completed, pay through the app and leave a review for the mechanic.',
              Icons.payment,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String stepNumber, String stepTitle, String stepDescription,
      IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stepNumber,
                  style: TextStyle(
                    color: color,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  stepTitle,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  stepDescription,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}