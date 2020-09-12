import 'package:flutter/material.dart';
import 'package:navigator/pages/my_home_page.dart';
import 'package:navigator/pages/second_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context)=> MyHomePage(),
        "/second":(BuildContext context)=> SecondPage(),
      },
    );
  }
}