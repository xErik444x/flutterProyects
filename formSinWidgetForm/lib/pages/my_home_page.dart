import 'package:flutter/material.dart';
import 'package:navigator/pages/second_page.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameTextController ;

  TextEditingController lastNameController ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "nombre"),
              controller: nameTextController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Apellido"),
              controller: lastNameController,
            ),
            RaisedButton(
              child: Text("mostrar segunda pantalla"),
               onPressed: (){_mostrarSegundaPantalla(context);},
              ),
          ],
        ),
      ),
    );
  }

  _mostrarSegundaPantalla(BuildContext context) {
    Navigator.of(context).pushNamed("/second",arguments:SecondPageArguments(name:nameTextController.text,lastName: lastNameController.text));
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameTextController =TextEditingController();
    lastNameController = TextEditingController() ;
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    lastNameController.dispose();
  }
}