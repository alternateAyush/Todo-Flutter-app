import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/todo_item.dart';

class ToDoTile extends StatelessWidget {
  final TodoItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  ToDoTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.task}',
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildDate(),
                  buildImportance(),
                ],
              ),
            ],
          ),
          buildCheckBox(),
        ],
      ),
    );
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(
          decoration: textDecoration,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
          decoration: textDecoration,
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          decoration: textDecoration,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildCheckBox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}
