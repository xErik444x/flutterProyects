import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(
          "https://i.pinimg.com/originals/86/5a/10/865a10d3e6fe8c9c1d10b9f6e6074df8.jpg"
          , height: 300,
          fit: BoxFit.cover,
          )
      ),
    );
  }
}