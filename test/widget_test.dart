import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: unused_import
import 'package:main/main.dart'; // Update this import based on your project's structure

void main() {
  testWidgets('Adding a task', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: mainn()));

    // Tap the '+' button to open the add task dialog.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter task details in the dialog.
    await tester.enterText(find.byKey(ValueKey('taskTitleField')), 'Test Task');
    await tester.enterText(
        find.byKey(ValueKey('taskDescriptionField')), 'Test Description');

    // Tap the date button to select a due date.
    await tester.tap(find.byKey(ValueKey('dueDateButton')));
    await tester.pumpAndSettle();

    // Select a date in the calendar.
    await tester
        .tap(find.text('1')); // Update this based on your calendar widget
    await tester.pumpAndSettle();

    // Tap the 'Add' button to add the task.
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Verify that the task has been added.
    expect(find.text('Test Task'), findsOneWidget);
  });
}
