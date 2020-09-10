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
      ),
      body: Center(),
      backgroundColor: Colors.deepOrangeAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: ()=>{print("cerrar")},
      ),
      drawer: Drawer(
        child: Center(
          child: Text("Drawer Izquierdo"),
        ),
      ),
      endDrawer: Drawer(child: Center(
          child: Text("Drawer Derecho"),
        ),),
    );
  }
}