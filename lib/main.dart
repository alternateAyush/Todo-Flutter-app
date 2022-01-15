import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/todo_screen.dart';
import 'models/models.dart';
import 'home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: AppTheme.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Color(0xFF1E2784))),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
