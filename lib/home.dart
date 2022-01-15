import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/todo_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/todo_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo',
          style: GoogleFonts.openSans(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: buildToDoScreen(),
    );
  }

  Widget buildToDoScreen() {
    return Consumer<TodoManager>(builder: (context, manager, child) {
      return TodoScreen(manager: manager);
    });
  }
}
