import 'package:flutter/material.dart';
import 'empty_todo_screen.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import 'todo_item_screen.dart';
import 'todo_list_screen.dart';

class TodoScreen extends StatefulWidget {
  final TodoManager manager;
  const TodoScreen({Key? key, required this.manager}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    widget.manager.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          final manager = Provider.of<TodoManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToDoItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      body: buildToDoScreen(),
    );
  }

  Widget buildToDoScreen() {
    return Consumer<TodoManager>(builder: (context, manager, child) {
      if (manager.todoItems.isNotEmpty) {
        return ToDoListScreen(manager: manager);
      } else {
        return const EmptyTodoScreen();
      }
    });
  }
}
