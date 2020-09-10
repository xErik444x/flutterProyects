import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botones',
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
        title: Text('Botones'),
      ),
      body: Center(
        child: Column(
          children: [
           FlatButton(
             onPressed: ()=>{},
              child: Text("Soy un boton plano",style: TextStyle(fontSize: 20),),
              textColor:Colors.white,
              color: Colors.blueAccent,
              ),
            RaisedButton(onPressed: (){},child: Text("Soy un raisedButton",style: TextStyle(fontSize: 20)),),
            IconButton(icon: Icon(Icons.access_time), onPressed: (){}),
            OutlineButton(onPressed: (){},child: Text("Soy un outline",style: TextStyle(fontSize: 20)))
          ],
        ),
      )
    );
  }

}