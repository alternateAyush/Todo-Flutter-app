import 'package:flutter/material.dart';
import '../models/models.dart';

class EmptyTodoScreen extends StatelessWidget {
  const EmptyTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('images/emptylist.png'),
              ),
            ),
            const Text(
              'Nothing to do just chill 😎',
              style: TextStyle(
                fontSize: 21.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
