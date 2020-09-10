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
      appBar: AppBar(
        title: Text("Scaffold"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=>{}
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: ()=>{}
          ),
        ],  
        elevation: 10, //sombra
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
          ),
      ),
      body: Center(),
    );
  }
}