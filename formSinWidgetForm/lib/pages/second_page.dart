import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SecondPageArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Segunda pantalla"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arguments.name),
            Text(arguments.lastName),
          ],
        ),
      ),
    );
  }
}

class SecondPageArguments{
  String name;
  String lastName;
  SecondPageArguments({this.name,this.lastName});
}