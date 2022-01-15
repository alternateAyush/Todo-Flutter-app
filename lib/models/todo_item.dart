import 'package:flutter/material.dart';

enum Importance { low, medium, high }

class TodoItem {
  final String id;
  final String task;
  final Importance importance;
  final Color color;
  final DateTime date;
  final bool isComplete;

  TodoItem({
    required this.id,
    required this.task,
    required this.importance,
    required this.color,
    required this.date,
    this.isComplete = false,
  });

  TodoItem copyWith({
    String? id,
    String? task,
    Importance? importance,
    Color? color,
    DateTime? date,
    bool? isComplete,
  }) {
    return TodoItem(
      id: id ?? this.id,
      task: task ?? this.task,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  TodoItem.fromMap(Map map)
      : this.id = map['id'],
        this.task = map['task'],
        this.importance = decodeImp(map['importance'].toString()),
        this.color = decodeColor(map['color'].toString()),
        this.date = decodeDate(map['date'].toString()),
        this.isComplete = decodeDone(map['isComplete'].toString());

  Map toMap() {
    return {
      'id': this.id,
      'task': this.task,
      'isComplete': encodeDone(this.isComplete),
      'importance': encodeImp(this.importance),
      'color': encodeColor(this.color),
      'date': encodeDate(this.date),
    };
  }
}

Importance decodeImp(String output) {
  if (output == '0') {
    return Importance.low;
  } else if (output == '1') {
    return Importance.medium;
  }
  return Importance.high;
}

String encodeImp(Importance input) {
  if (input == Importance.low) {
    return '0';
  } else if (input == Importance.medium) {
    return '1';
  }
  return '2';
}

String encodeDone(bool isDone) {
  if (isDone == false) {
    return 'false';
  }
  return 'true';
}

bool decodeDone(String isDone) {
  if (isDone == 'false') {
    return false;
  }
  return true;
}

String encodeColor(Color label) {
  List<Color> Range = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  for (int i = 0; i < Range.length; i++) {
    if (label == Range[i]) {
      return '$i';
    }
  }
  return '0';
}

Color decodeColor(String output) {
  List<Color> Range = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  for (int i = 0; i < Range.length; i++) {
    String j = i.toString();
    if (output == j) {
      return Range[i];
    }
  }
  return Range[0];
}

String encodeDate(DateTime date) {
  return date.toIso8601String();
}

DateTime decodeDate(String dateString) {
  DateTime? date = DateTime.tryParse(dateString);
  if (date != null) {
    return date;
  } else {
    return DateTime.now();
  }
}
