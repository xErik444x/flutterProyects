import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key
  }): super(key: key);
  List < String > names = ["hola", "jose", "erik", "cosas", "palabras", "jose", "erik", "cosas", "palabras", "jose", "erik", "cosas", "palabras", "jose", "erik", "cosas", "palabras", "jose", "erik", "cosas", "palabras"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        children: [
          Image.asset("assets/img/pinguino1.jpg", fit: BoxFit.cover),
          Image.asset("assets/img/pinguino2.jpg", fit: BoxFit.cover),
          Image.asset("assets/img/pinguino3.jpg", fit: BoxFit.cover)
        ],
      )
    );
  }
}