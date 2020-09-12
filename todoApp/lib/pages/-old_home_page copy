import 'package:flutter/material.dart';
import 'package:todoApp/database/database_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseMain db = DatabaseMain();
  List tareas = [];

  TextEditingController textoInput = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textoInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do App"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTarea(),
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: db.initDB(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _showList(context);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  _addTarea() {
    showDialog(
      context: context,
      builder: (context) {
        var _validate;
        return SimpleDialog(
          title: Text("crear tarea"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
          children: [
            SimpleDialogOption(
              child: TextField(
                controller: textoInput,
                autofocus: true,
                decoration:
                    InputDecoration(
                      labelText: "Texto", 
                    icon: Icon(Icons.add),),
                onSubmitted: (text) {  
                  if(text.isEmpty){
                    return null;
                  }       
                  setState(() {
                    text.isEmpty ? _validate = "Error." : _validate = "";
                    var task = Task(text, false);
                    // tareas.add(text);
                    db.insert(task);
                    textoInput.clear();
                    Navigator.pop(context); //elimina el dialog
                  });
                   }
              ),
            ),
          ],
        );
      },
    );
  }

  _showList(BuildContext context) {
    return FutureBuilder(
        future: db.getAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              print(snapshot.data);
              return Center(
                child: Text("no hay tareas."),
              );
            } else {
              print(snapshot.data);
              return ListView(
                children: [
                  for (Task task in snapshot.data)
                    ListTile(
                      title: Text(task.name),
                      onTap: () async {
                        task.completed = !task.completed;
                        await db.updateTask(task);
                        setState(() {});
                      },
                      leading: Icon(task.completed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await db.deleteTask(task);
                            setState(() {});
                          }),
                    ),
                ],
              );
            }
          } else {
            return Center(
              child: Text("no hay tareas."),
            );
          }
        });
  }
}
