import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

part 'list_controller.g.dart';

class ListController = ListControllerBase with _$ListController;

abstract class ListControllerBase with Store {
  @observable
  List toDoList = [];

  @observable
  TextEditingController novaTarefaController = TextEditingController();

  @observable
  Map<String, dynamic> lastRemoved;

  @observable
  int lastRemovedPos;

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(toDoList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return e.toString();
    }
  }

  @action
  void addToDo() {
    Map<String, dynamic> newToDo = Map();
    newToDo["title"] = novaTarefaController.text;
    novaTarefaController.text = "";
    newToDo["ok"] = false;
    toDoList.add(newToDo);
    saveData();
  }

  @action
  void updateData(context, index) {
    toDoList.removeAt(index);

    Map<String, dynamic> newToDo = Map();
    newToDo["title"] = novaTarefaController.text;
    novaTarefaController.text = "";
    newToDo["ok"] = false;
    toDoList.insert(index, newToDo);
    saveData();
  }

  @action
  void initRead() {
    readData().then((data) {
      toDoList = json.decode(data);
    });
  }

  @action
  void deleteData(context, index) {
    lastRemoved = Map.from(toDoList[index]);
    lastRemovedPos = index;
    toDoList.removeAt(index);

    saveData();

    final snack = SnackBar(
      content: Text("Tarefa \"${lastRemoved["title"]}\" removida!"),
      action: SnackBarAction(
          label: "Desfazer",
          onPressed: () {
            toDoList.insert(lastRemovedPos, lastRemoved);
            saveData();
          }),
      duration: Duration(seconds: 2),
    );

    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snack);
  }

  @action
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 1));

    toDoList.sort((a, b) {
      if (a["ok"] && !b["ok"])
        return 1;
      else if (!a["ok"] && b["ok"])
        return -1;
      else
        return 0;
    });

      saveData();

    return null;
  }
}
