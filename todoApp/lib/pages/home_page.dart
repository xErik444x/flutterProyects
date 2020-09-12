import 'package:flutter/material.dart';
import 'package:todoApp/database/database_main.dart';
import 'package:intl/intl.dart';

import 'edit_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseMain db = DatabaseMain();
  DateTime date = DateTime.now();
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Text(
                  "${DateFormat('d').format(date)}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                    "${DateFormat('MMM').format(date)}", style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        ),textAlign: TextAlign.left,),
                         Text(
                    "${DateFormat('y').format(date)}", style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                    ],
                  ),
                ),
                 Expanded(
                                  child: Text(
                      "${DateFormat('EEEE').format(date)}", style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),textAlign: TextAlign.end,),
                 )
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 100.0,
                width: 100.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () => _addTarea(),
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green[300],
                  ),
                ))),
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
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          children: [
            SimpleDialogOption(
              child: TextField(
                  controller: textoInput,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Texto",
                    icon: Icon(Icons.add),
                  ),
                  onSubmitted: (text) {
                    if (text.isEmpty) {
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
                  }),
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    for (Task task in snapshot.data)
                      ListTile(
                        title: Text(task.name,style: task.completed ? TextStyle(color: Colors.black54,fontSize: 25) : TextStyle( color:Colors.black,fontSize: 25),),
                        onTap: () async {
                          task.completed = !task.completed;
                          await db.updateTask(task);
                          setState(() {});
                        },
                        // leading: Icon(task.completed
                        //     ? Icons.check_box
                        //     : Icons.check_box_outline_blank,color: Colors.green[300]),
                        trailing: IconButton(
                            icon: Icon(Icons.edit,color: Colors.green[300],size: 30,),
                            onPressed: () async {
                              // await db.deleteTask(task);
                             await Navigator.pushNamed(context,"/edit",arguments:EditPageArguments(id:task.id,text:task.name,completada:task.completed,db:db));
                              setState(() {});
                            }),
                      ),
                  ],
                ),
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
