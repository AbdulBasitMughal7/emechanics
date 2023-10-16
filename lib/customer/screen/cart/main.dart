import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:untitled5/customer/screen/cart/cartmodel.dart';
import 'package:untitled5/customer/screen/cart/cartpage.dart';
import 'package:untitled5/customer/screen/cart//home.dart';
import 'package:untitled5/customer/screen/cart/main.dart';


void main() => runApp(MyApp(model: CartModel(), ));


class MyApp extends StatelessWidget{

  final CartModel model;

  const MyApp({ required this.model}) ;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: HomePage(),
        routes: {'/cart': (context) => CartPage()},
      ),
    );
  }
}