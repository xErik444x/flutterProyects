import 'package:flutter/material.dart';
import 'package:todoApp/database/database_main.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

 @override
  Widget build(BuildContext context) {
    EditPageArguments arguments = ModalRoute.of(context).settings.arguments;

    DatabaseMain db = arguments.db;

    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: arguments.task.name,
                  icon: Icon(Icons.add),
                ),
                onSubmitted: (text) async {
                  if (text.isEmpty) {
                    return null;
                  }else{
                    Task task = new Task(text, arguments.task.completed);
                    task.id = arguments.id;
                    await db.updateTask(task);
                    print(task.id);
                    Navigator.pop(context);
                  }
                }),
            IconButton(icon: Icon(Icons.delete), onPressed: () async {
              Task task = new Task("",false);
              task.id = arguments.id;
              await db.deleteTask(task);
                Navigator.pop(context);
               })
          ],
        ),
      ),
    );
  }
}

class EditPageArguments {
  DatabaseMain db;
  Task task;
  int id;

  EditPageArguments({this.task,this.id, this.db});
}
