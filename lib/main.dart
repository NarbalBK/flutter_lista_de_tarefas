import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_de_tarefas/list_controller.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListController listController = ListController();

  @override
  void initState() {
    super.initState();
    //TODO colocar o initRead
    listController.initRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "Nova Tarefa",
                            labelStyle: TextStyle(color: Colors.blueAccent)),
                        controller: listController.novaTarefaController),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("ADD"),
                    textColor: Colors.white,
                    onPressed: () {
                      listController.addToDo();
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                  child: Observer(
                                      builder: (_) => ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: listController.toDoList.length,
                        itemBuilder: _buildItem),
                  ),
                  onRefresh: () {
                    return listController.refresh();
                  }),
            ),
          ],
        ));
  }

  Widget _buildItem(context, index) {
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ),
        direction: DismissDirection.startToEnd,
        child: Observer(
                  builder: (_) => CheckboxListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(listController.toDoList[index]["title"]),
                Row(
                  children: [
                    IconButton(
                        splashRadius: 20,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          listController.deleteData(context, index);
                        }),
                    Observer(
                                          builder: (_) => IconButton(
                          splashRadius: 20,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            listController.novaTarefaController.text =
                                listController.toDoList[index]["title"];
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueAccent)),
                                                controller: listController
                                                    .novaTarefaController),
                                          ),
                                          RaisedButton(
                                            color: Colors.blueAccent,
                                            child: Text("OK"),
                                            textColor: Colors.white,
                                            onPressed: () {
                                              listController.updateData(
                                                  context, index);
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                          }),
                    ),
                  ],
                )
              ],
            ),
            value: listController.toDoList[index]["ok"],
            secondary: CircleAvatar(
              child: Icon(listController.toDoList[index]["ok"]
                  ? Icons.check
                  : Icons.error),
            ),
            onChanged: (c) {
              listController.toDoList[index]["ok"] = c;
              listController.saveData();
            },
          ),
        ),
        onDismissed: (direction) {
          listController.deleteData(context, index);
        });
  }
}
