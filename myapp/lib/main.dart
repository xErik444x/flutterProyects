import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gesture Detector',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
               onTap: _onTap,
              child:Text("hola",style: TextStyle(fontSize: 30),) ,
            ),
            GestureDetector(
              onLongPress: ()=>{print("mantenido")},
              onTap: _onTap,
              child:Text("hola",style: TextStyle(fontSize: 30),) ,
            ),
            

          ],
        ),
      )
    );
  }

  void _onTap() {
    print("hola");
  }
}