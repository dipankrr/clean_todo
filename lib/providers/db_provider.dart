
import 'package:clean_todo/data/dbhelper.dart';
import 'package:flutter/material.dart';


class DBProvider extends ChangeNotifier {

  List<Map<String, dynamic>> allToDoData = [];

  DBHelper? dbRef;

  DBProvider() {
    dbRef = DBHelper.instance;
    _init();
  }
  Future<void> _init() async {
    await getTableDataP();
  }

  ///////////////////////////////////////////////////////////////////

  Future <void> getTableDataP() async {
    allToDoData = await dbRef!.getTableData();
    notifyListeners();
  }


  Future <void> addToDoP ({ required String todoP, required bool isTodayP }) async {
    await dbRef!.addTodo( todoP, isTodayP);
    getTableDataP();
  }

  Future <void> updateCheckP({ required int snoP, required bool isDoneP}) async {
    await dbRef!.updateTodoStatus(snoP, isDoneP);
    getTableDataP();
  }

  Future <void> deleteGoalP( int snoP) async {
    await dbRef!.deleteTodo(snoP);
    getTableDataP();
  }

  Future <void> updateDayP({ required int snoP, required bool isTodayP}) async {
    await dbRef!.updateTodoDay(snoP, isTodayP);
    getTableDataP();
  }

  Future <void> updateTodoP({ required int snoP, required String newTodoP}) async {
    await dbRef!.updateTodo(snoP, newTodoP);
    getTableDataP();
  }


}