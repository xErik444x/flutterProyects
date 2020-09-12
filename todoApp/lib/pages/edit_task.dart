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
    TextEditingController _controller = new TextEditingController()..text =arguments.task.name;

    @override
    void initState() {
      super.initState();
      _controller = new TextEditingController()..text =arguments.task.name ;
    }

    @override
    dispose() {
      super.dispose();
      _controller.dispose();
    }

    DatabaseMain db = arguments.db;

    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          child: FittedBox(
                    child: FloatingActionButton(
                child: Icon(Icons.delete,color: Colors.white,),
                backgroundColor: Colors.red[400],
                      onPressed: () async {
                        Task task = new Task("", false);
                        task.id = arguments.id;
                        await db.deleteTask(task);
                        Navigator.pop(context);
                      }),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(fontSize: 30),
              controller:_controller,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "texto",
                  icon: Icon(Icons.add),
                ),
                onSubmitted: (text) async {
                  if (text.isEmpty) {
                    return null;
                  } else {
                    Task task = new Task(text, arguments.task.completed);
                    task.id = arguments.id;
                    await db.updateTask(task);
                    print(task.id);
                    Navigator.pop(context);
                  }
                }),
                SizedBox(height: 70,),

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

  EditPageArguments({this.task, this.id, this.db});
}
