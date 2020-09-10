import 'package:flutter/material.dart';
import 'package:navigator/pages/second_page.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home")),
      body: Center(
        child: RaisedButton(
          child: Text("mostrar segunda pantalla"),
           onPressed: (){_mostrarSegundaPantalla(context);},
          ),
      ),
    );
  }

  _mostrarSegundaPantalla(BuildContext context) {
    Navigator.of(context).pushNamed("/second",arguments:SecondPageArguments(name:"Erik",lastName:"jejox"));
  }
}