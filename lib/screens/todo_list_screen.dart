import 'package:flutter/material.dart';
import '../components/todo_tile.dart';
import '../models/models.dart';
import 'todo_item_screen.dart';

class ToDoListScreen extends StatefulWidget {
  final TodoManager manager;
  const ToDoListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    final toDoItems = widget.manager.todoItems;
    return ListView.separated(
        itemBuilder: (context, index) {
          final item = toDoItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              widget.manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.task} completed 👍')));
            },
            child: InkWell(
              child: ToDoTile(
                item: item,
                key: Key(item.id),
                onComplete: (change) {
                  if (change != null) {
                    widget.manager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (conext) => ToDoItemScreen(
                      originalItem: item,
                      onCreate: (item) {},
                      onUpdate: (item) {
                        widget.manager.updateItem(item, index);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemCount: toDoItems.length);
  }
}
