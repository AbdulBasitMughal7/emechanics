import 'package:untitled5/customer/screen/Addvehcile/addvehicle.dart';
import 'package:untitled5/customer/screen/Addvehcile/selectvehicle.dart';
import 'package:untitled5/customer/screen/Addvehcile/bike.dart';
import 'package:flutter/material.dart';

class SelectVehicle extends StatelessWidget {
  const SelectVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Select a Vehicle')),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            SizedBox(
              height:50,
              width:100,
              child: ElevatedButton(
                child : Text('Car'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => addvehicle()));
                },
              ),

            ),
            SizedBox(height:15),
            SizedBox(
              height:50,
              width:100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                ),
                child : Text('Bike'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bike()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
