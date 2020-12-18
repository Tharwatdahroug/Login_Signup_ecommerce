import 'package:ecommerce/screen/auth_screen.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:ecommerce/screen/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Auth(),
      routes: {
        login.routeName: (ctx) => login(),
        sigup.routeName: (ctx) => sigup(),
      },
    );
  }
}
