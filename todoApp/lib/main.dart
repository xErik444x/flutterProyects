import 'package:flutter/material.dart';
import 'package:todoApp/pages/edit_task.dart';
import 'package:todoApp/pages/home_page.dart';
// import 'package:permission_handler/permission_handler.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // checkPermission();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/edit": (BuildContext context) =>EditPage(),
      },
      initialRoute: "/",
    );
  }

// checkPermission() async {
//       var status = await Permission.storage.status;
//       print(status);
//     if (status.isUndetermined) {
//       print("undeterminated");
//     }

//     if (await Permission.storage.isRestricted) {
//       print("restricted");
//     }
// }

}