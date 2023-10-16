import 'package:flutter/material.dart';



class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const ExpansionTile(
            title: Text("How do I create an account?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "To create an account, tap the Sign Up button on the login screen and fill in the required information."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("How do I reset my password?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "To reset your password, tap FORGOT PASSWORD on the login screen and follow the prompts."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("How do I contact support?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "You can contact support by emailing support@emechanic.com or by calling 000-000-000."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("How do i schedule appointment?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "To schedule a service appointment, tap the 'Schedule Service' button on the main menu and select the date and time that works best for you."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("What types of services do you offer?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "We offer a range of services, including oil changes, tire rotation, brake repair, engine diagnostics, and more."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("How can I pay for my services?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "You can pay for your services using Stripe, or by paying cash."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("How long will my service take?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "The length of time for your service will depend on the type of the service you are getting. Please contact your technician for an estimated time of completion."),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text(
                "What happens if my car requires additional service beyond what i scheduled?"),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "The technician will inform you of any additional services needed and provide you with an estimate for the additional cost before proceeding"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
