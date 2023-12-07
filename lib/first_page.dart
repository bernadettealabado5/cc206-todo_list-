import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' show DateFormat;

class Task {
  String title;
  String description;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.dueTime,
    this.isCompleted = false,
  });
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime today = DateTime.now();
  Map<DateTime, List<Task>> tasksByDate = {};

  @override
  void initState() {
    super.initState();

    // Sample tasks for demonstration
    tasksByDate[DateTime.parse('2023-11-18')] = [
      Task(
        title: 'Task 1',
        description: 'Complete coding assignment',
        dueDate: DateTime.parse('2023-11-18'),
        dueTime: const TimeOfDay(hour: 12, minute: 0),
        isCompleted: false,
      ),
      Task(
        title: 'Task 2',
        description: 'Attend online meeting',
        dueDate: DateTime.parse('2023-11-18'),
        dueTime: const TimeOfDay(hour: 14, minute: 30),
        isCompleted: false,
      ),
    ];
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });

    // Check if there are tasks for the selected date
    List<Task> tasks = tasksByDate[day] ?? [];
    if (tasks.isNotEmpty) {
      _displayTaskDetailsDialog(day, tasks);
    } else {
      _showNoTasksDialog(day);
    }
  }

  void _displayTaskDetailsDialog(
      DateTime selectedDate, List<Task> tasksToShow) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text('Tasks on ${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
          content: Column(
            children: tasksToShow.map((task) {
              return ListTile(
                title: Text(task.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.description),
                    Text(
                      'Due Date: ${DateFormat('yyyy-MM-dd').format(task.dueDate)}',
                    ),
                  ],
                ),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      task.isCompleted = value!;
                    });
                  },
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showNoTasksDialog(DateTime selectedDate) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No Tasks for this Date'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Code Daily!')),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: 'en_US',
            rowHeight: 43,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) =>
                DateTime(day.year, day.month, day.day) ==
                DateTime(today.year, today.month, today.day),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
        ),
      ],
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  TimeOfDay today = TimeOfDay.now();
  Map<TimeOfDay, List<Task>> tasksByTime = {};

  var selectedTime;

  void _onTimeSelected(TimeOfDay time, TimeOfDay focusedTime) {
    setState(() {
      today = time;
    });

    // Show the tasks related to the selected day
    _showTaskListDialog(time);
  }

  void _showTaskListDialog(TimeOfDay selectedTime) {
    List<Task> tasks = tasksByTime[selectedTime] ?? [];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tasks on ${selectedTime.toString()}'),
          content: Column(
            children: tasks.map((task) {
              return ListTile(
                title: Text(task.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.description),
                    Text('Due Time: ${task.dueTime.toString()}'),
                  ],
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _selectTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: today,
    );

    if (selectedTime != null) {
      _onTimeSelected(selectedTime, today);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return the widgets that make up your app's UI
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          // Add a button to trigger the time picker
          ElevatedButton(
            onPressed: _selectTime,
            child: Text('Select Time'),
          ),
        ],
      ),
    );
  }
}
