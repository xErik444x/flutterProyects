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
        child: IconButton(
          icon:  Icon(
            Icons.close,
            color: Colors.blue,
            ),
          iconSize: 200,
         onPressed: ()=>{print("hola")
         }
         )
      ),
    );
  }
}