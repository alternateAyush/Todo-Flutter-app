import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_item.dart';
import 'dart:convert';

class TodoManager extends ChangeNotifier {
  List<TodoItem> todoItems = <TodoItem>[];

  //List<TodoItem> get todoItems => List.unmodifiable(_todoItems);

  void deleteItem(int index) {
    todoItems.removeAt(index);
    saveData();
    notifyListeners();
  }

  void addItem(TodoItem item) {
    todoItems.add(item);
    saveData();
    notifyListeners();
  }

  void updateItem(TodoItem item, int index) {
    todoItems[index] = item;
    saveData();
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = todoItems[index];
    todoItems[index] = item.copyWith(isComplete: change);
    saveData();
    notifyListeners();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> spList =
        todoItems.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList('uniqueKey', spList);
    print('S A V E D');
  }

  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('uniqueKey')) {
      // 3
      final spList = pref.getStringList('uniqueKey');
      // 4
      if (spList != null) {
        todoItems =
            spList.map((item) => TodoItem.fromMap(json.decode(item))).toList();
        print('L O A D E D');
      } else {
        todoItems = <TodoItem>[];
        print('E M P T Y');
      }
    }
    notifyListeners();
  }
}
