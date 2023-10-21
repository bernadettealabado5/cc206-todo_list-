// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:cc206_todo_list/features/overall_task.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const TaskListApp(),
    ));
