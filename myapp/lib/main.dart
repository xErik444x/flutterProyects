import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body:  ListView(
          children: [
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
            Card(
              child: Image.network("https://thispersondoesnotexist.com/image"),
            ),
          ],
        )
      ),
    );
  }
}