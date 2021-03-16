// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on ListControllerBase, Store {
  final _$toDoListAtom = Atom(name: 'ListControllerBase.toDoList');

  @override
  List<dynamic> get toDoList {
    _$toDoListAtom.reportRead();
    return super.toDoList;
  }

  @override
  set toDoList(List<dynamic> value) {
    _$toDoListAtom.reportWrite(value, super.toDoList, () {
      super.toDoList = value;
    });
  }

  final _$novaTarefaControllerAtom =
      Atom(name: 'ListControllerBase.novaTarefaController');

  @override
  TextEditingController get novaTarefaController {
    _$novaTarefaControllerAtom.reportRead();
    return super.novaTarefaController;
  }

  @override
  set novaTarefaController(TextEditingController value) {
    _$novaTarefaControllerAtom.reportWrite(value, super.novaTarefaController,
        () {
      super.novaTarefaController = value;
    });
  }

  final _$lastRemovedAtom = Atom(name: 'ListControllerBase.lastRemoved');

  @override
  Map<String, dynamic> get lastRemoved {
    _$lastRemovedAtom.reportRead();
    return super.lastRemoved;
  }

  @override
  set lastRemoved(Map<String, dynamic> value) {
    _$lastRemovedAtom.reportWrite(value, super.lastRemoved, () {
      super.lastRemoved = value;
    });
  }

  final _$lastRemovedPosAtom = Atom(name: 'ListControllerBase.lastRemovedPos');

  @override
  int get lastRemovedPos {
    _$lastRemovedPosAtom.reportRead();
    return super.lastRemovedPos;
  }

  @override
  set lastRemovedPos(int value) {
    _$lastRemovedPosAtom.reportWrite(value, super.lastRemovedPos, () {
      super.lastRemovedPos = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('ListControllerBase.refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$ListControllerBaseActionController =
      ActionController(name: 'ListControllerBase');

  @override
  void addToDo() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.addToDo');
    try {
      return super.addToDo();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateData(dynamic context, dynamic index) {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.updateData');
    try {
      return super.updateData(context, index);
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initRead() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.initRead');
    try {
      return super.initRead();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteData(dynamic context, dynamic index) {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.deleteData');
    try {
      return super.deleteData(context, index);
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDoList: ${toDoList},
novaTarefaController: ${novaTarefaController},
lastRemoved: ${lastRemoved},
lastRemovedPos: ${lastRemovedPos}
    ''';
  }
}
