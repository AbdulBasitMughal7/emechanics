

import 'package:flutter/material.dart';

class Bike extends StatefulWidget {

  @override
  State<Bike> createState() => _BikeState();
}

class _BikeState extends State<Bike> {

  String make = "";
  String year = "";
  String model = "";
  String trim= "";
  String value="";
  String transmission="";
  String air="";
  String steering="";
  String headlight="";
  String driveType="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bike'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height:70.0),
                const Text(
                  'Tell us about your Bike',
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.black,
                      fontSize:30.0),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Toyota",
                            child: Center(
                              child: Text("Toyota"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Mira",
                            child: Center(
                              child: Text("Mira"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "WagonR",
                            child: Center(
                              child: Text("WagonR"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            make = _value!;
                          });
                        },
                        hint: const Text(
                            "Make"
                        ),
                      ),
                      Text(
                        "$make",
                        style : const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "2022",
                            child: Center(
                              child: Text("2022"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "2021",
                            child: Center(
                              child: Text("2021"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "2020",
                            child: Center(
                              child: Text("2020"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            year = _value!;
                          });
                        },
                        hint: const Text(
                            "Year"
                        ),
                      ),
                      Text(
                        "$year",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "2001",
                            child: Center(
                              child: Text("2001"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "2002",
                            child: Center(
                              child: Text("2002"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "2003",
                            child: Center(
                              child: Text("2003"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            model = _value!;
                          });
                        },
                        hint: const Text(
                            "Model"
                        ),
                      ),
                      Text(
                        "$model",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "XYZ",
                            child: Center(
                              child: Text("XYZ"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "ABC",
                            child: Center(
                              child: Text("ABC"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "DEF",
                            child: Center(
                              child: Text("DEF"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            trim = _value!;
                          });
                        },
                        hint: const Text(
                            "Trim/Engine"
                        ),
                      ),
                      Text(
                        "$trim",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),

                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Automatic",
                            child: Center(
                              child: Text("Automatic"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Manual",
                            child: Center(
                              child: Text("Manual"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            transmission = _value!;
                          });
                        },
                        hint: const Text(
                            "Transmission Type"
                        ),
                      ),
                      Text(
                        "$transmission",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Yes",
                            child: Center(
                              child: Text("Yes"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "No",
                            child: Center(
                              child: Text("No"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            air = _value!;
                          });
                        },
                        hint: const Text(
                            "Air Conditions"
                        ),
                      ),
                      Text(
                        "$air",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Power Steering",
                            child: Center(
                              child: Text("Power Steering"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Manual Steering",
                            child: Center(
                              child: Text("Manual Steering"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            steering = _value!;
                          });
                        },
                        hint: const Text(
                            "Steering Type"
                        ),
                      ),
                      Text(
                        "$steering",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Helogen",
                            child: Center(
                              child: Text("Helogen"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Xenon",
                            child: Center(
                              child: Text("Xenon"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Led",
                            child: Center(
                              child: Text("Led"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            headlight = _value!;
                          });
                        },
                        hint: const Text(
                            "Headlight Bulb Type"
                        ),
                      ),
                      Text(
                        "$headlight",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem<String>(
                            value: "All-wheel-drive(AWD)",
                            child: Center(
                              child: Text("All-wheel-drive(AWD)"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Front-wheel-drive(FWD)",
                            child: Center(
                              child: Text("Front-wheel-drive(FWD)"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Rear-wheel-drive(RWD)",
                            child: Center(
                              child: Text("Rear-wheel-drive(RWD)"),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "4-wheel-drive(4WD)",
                            child: Center(
                              child: Text("4-wheel-drive(4WD)"),
                            ),
                          ),
                        ],
                        onChanged: (_value){
                          setState(() {
                            driveType = _value!;
                          });
                        },
                        hint: const Text(
                            "Drive Type"
                        ),
                      ),
                      Text(
                        "$driveType",
                        style : const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
