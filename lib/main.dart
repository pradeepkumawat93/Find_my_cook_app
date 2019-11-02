import 'package:flutter/material.dart';
import 'package:find_my_cook_app/login_page/login.dart';
//import 'package:find_my_cook_app/loader/loader.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Login("coock"),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}