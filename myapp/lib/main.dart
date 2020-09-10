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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
List<String> names = ["hola","jose","erik","cosas","palabras","jose","erik","cosas","palabras","jose","erik","cosas","palabras","jose","erik","cosas","palabras","jose","erik","cosas","palabras"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body:  ListView.builder( //apunta a una lista
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(title: Text(names[index]),
            leading: Icon(Icons.person),
            onTap: ()=>{print(names[index])},);
          }
          )
      );
  }
}