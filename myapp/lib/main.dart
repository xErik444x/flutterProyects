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
          itemCount: 30,
          itemBuilder: (BuildContext context, int index){
           return Image.network("https://picsum.photos/id/$index/400/400",fit: BoxFit.cover,);
          }
          )
      );
  }
}