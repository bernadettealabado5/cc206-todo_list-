// ignore_for_file: unused_import

import 'package:cc206_todo_list/features/overall_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cc206_todo_list/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TaskListApp());

    // Verify that our widget is correctly displayed.
    expect(find.text('0'), findsOneWidget);

    // You can continue writing your test here...
  });
}
