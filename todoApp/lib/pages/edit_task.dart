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
    TextEditingController _controller = new TextEditingController()
      ..text = arguments.task.name;

    @override
    void initState() {
      super.initState();
      _controller = new TextEditingController()..text = arguments.task.name;
    }

    @override
    dispose() {
      super.dispose();
      _controller.dispose();
    }

    DatabaseMain db = arguments.db;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("EDIT TASK",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.green[300],
                fontSize: 40,)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          child: FittedBox(
            child: FloatingActionButton(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
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
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.multiline,
                controller: _controller,
                minLines: 1,
                maxLines: 20,
                //autofocus: true,
                decoration: InputDecoration(
                  labelText: "texto",
                  //icon: Icon(Icons.add),
                ),
                // onSubmitted: (text) async {
                //   if (text.isEmpty) {
                //     return null;
                //   } else {
                //     Task task = new Task(text, arguments.task.completed);
                //     task.id = arguments.id;
                //     await db.updateTask(task);
                //     print(task.id);
                //     Navigator.pop(context);
                //   }
                //}
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50,0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0),
                )),
                  onPressed: () async {
                    var text = _controller.text;
                    var singleline = text.replaceAll("\n", "");
                    if(singleline.isNotEmpty){
                     Task task = new Task(text, arguments.task.completed);
                      task.id = arguments.id;
                      await db.updateTask(task);
                      print(task.id);
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 60,
                   
                  ),
                  color:Colors.green[300],
                  ),
            )
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
