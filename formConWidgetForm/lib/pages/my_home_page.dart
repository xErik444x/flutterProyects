import 'package:flutter/material.dart';
import 'package:navigator/pages/second_page.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String nameValue;
String lastNameValue;

//nos permite entrar al arbol de widget desde cualquier lugar
 final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (input){
                if(input.isEmpty){
                  return 'Please put your name';
                }},
                decoration: InputDecoration(labelText: "nombre"),
                onSaved: (value){
                  nameValue = value;
                },
               
              ),
              
              TextFormField(
                validator: (input){
                if(input.isEmpty){
                  return 'Please put your lastname';
                }},
                decoration: InputDecoration(labelText: "Apellido"),
                onSaved: (value){
                  lastNameValue = value;
                }
              ),
              RaisedButton(
                child: Text("mostrar segunda pantalla"),
                 onPressed: (){_mostrarSegundaPantalla(context);},
                ),
            ],
          ),
        ),
      ),
    );
  }

  _mostrarSegundaPantalla(BuildContext context) {

    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Navigator.of(context).pushNamed("/second",
    arguments:SecondPageArguments(name: this.nameValue,lastName: this.lastNameValue));
    }
    
  }

}