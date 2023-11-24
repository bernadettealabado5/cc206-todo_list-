import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'first_page.dart'; // Add this line to import first_page.dart
import 'package:intl/intl.dart' show DateFormat;

// main
void main() {
  runApp(MaterialApp(
    title: 'Flutter Todo App',
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    home: TodoScreen(),
  ));
}

// MainApp class
class mainn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: TodoScreen(),
    );
  }
}

// Task class
class Task {
  String title;
  String description;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isCompleted;

  Task(this.title, this.description, this.dueDate, this.dueTime,
      {this.isCompleted = false});
}

// TodoScreen class
class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = [];
  Map<DateTime, List<Task>> tasksByDate = {};

  List<Task> getTasks() {
    return tasks;
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String newTaskTitle = '';
        String newTaskDescription = '';
        DateTime newTaskDueDate = DateTime.now();
        TimeOfDay newTaskDueTime = TimeOfDay.now();

        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newTaskTitle = value;
                },
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                onChanged: (value) {
                  newTaskDescription = value;
                },
                decoration: InputDecoration(labelText: 'Task Description'),
              ),
              Row(
                children: [
                  Text('Due Date:'),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          newTaskDueDate = selectedDate;
                        });
                      }
                    },
                    child: Text(
                      '${newTaskDueDate.year}-${newTaskDueDate.month}-${newTaskDueDate.day}',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Due Time:'),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 10, minute: 47),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          newTaskDueTime = selectedTime;
                        });
                      }
                    },
                    child: Text(
                      '${newTaskDueTime.hour}-${newTaskDueTime.minute}',
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  Task newTask = Task(
                    newTaskTitle,
                    newTaskDescription,
                    newTaskDueDate,
                    newTaskDueTime,
                  );

                  // Add the task to the tasksByDate map
                  tasksByDate[newTaskDueDate] = [
                    ...?tasksByDate[newTaskDueDate],
                    newTask
                  ];

                  setState(() {
                    tasks.add(newTask);
                  });

                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // toggleTaskCompletion
  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FirstPage()), // Change this line
            );
          },
          child: Text('ToDo App'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TaskCategoryBox(
                title: 'Pending',
                tasks: tasks
                    .where((task) =>
                        !task.isCompleted &&
                        task.dueDate.isAfter(DateTime.now()))
                    .toList(),
                onToggle: _toggleTaskCompletion,
                onCategoryTap:
                    _showTaskListDialog, // Pass the function to handle category tap
              ),
              TaskCategoryBox(
                title: 'Completed',
                tasks: tasks.where((task) => task.isCompleted).toList(),
                onToggle: _toggleTaskCompletion,
                onCategoryTap:
                    _showTaskListDialog, // Pass the function to handle category tap
              ),
              TaskCategoryBox(
                title: 'Overdue',
                tasks: tasks
                    .where((task) =>
                        !task.isCompleted &&
                        task.dueDate.isBefore(DateTime.now()))
                    .toList(),
                onToggle: _toggleTaskCompletion,
                onCategoryTap:
                    _showTaskListDialog, // Pass the function to handle category tap
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: tasks.map((task) {
                return ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.description),
                      Text(
                        'Due Date: ${DateFormat('yyyy-MM-dd').format(task.dueDate)}, '
                        'Due Time: ${task.dueTime.format(context)}',
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editTask(task);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(task);
                        },
                      ),
                      Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          _toggleTaskCompletion(task);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  // showAddTask dialog

  // EDIT TASK
  void _editTask(Task task) {
    TextEditingController titleController =
        TextEditingController(text: task.title);
    TextEditingController descriptionController =
        TextEditingController(text: task.description);
    DateTime dueDate = task.dueDate;
    TimeOfDay dueTime = task.dueTime;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Task Description'),
              ),
              Row(
                children: [
                  Text('Due Date:'),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: dueDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          dueDate = selectedDate;
                        });
                      }
                    },
                    child: Text(
                      '${dueDate.year}-${dueDate.month}-${dueDate.day}',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Due Time:'),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: dueTime,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          dueTime = selectedTime;
                        });
                      }
                    },
                    child: Text(
                      '${dueTime.hour}-${dueTime.minute}',
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    task.title = titleController.text;
                    task.description = descriptionController.text;
                    task.dueDate = dueDate;
                    task.dueTime = dueTime;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // DELETE TASK
  void _deleteTask(Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.remove(task);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Show task list dialog
  void _showTaskListDialog(List<Task> tasksToShow) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tasks'),
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
                    _toggleTaskCompletion(task);
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
}

class TaskCategoryBox extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  final Function(Task) onToggle;
  final Function(List<Task>) onCategoryTap;

  TaskCategoryBox({
    required this.title,
    required this.tasks,
    required this.onToggle,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCategoryTap(tasks); // Pass the tasks to the category tap handler
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 140, 134, 134),
        ),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              '${tasks.length}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  final DateTime selectedDate;

  MyApp({required this.selectedDate});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();
  Map<DateTime, List<Task>> tasksByDate = {};

  @override
  void initState() {
    super.initState();
    today = widget.selectedDate;
    _loadTasksForSelectedDate(today);
  }

  void _loadTasksForSelectedDate(DateTime selectedDate) {
    List<Task> tasksToShow = tasksByDate[selectedDate] ?? [];
    if (tasksToShow.isNotEmpty) {
      _showTaskListDialog(selectedDate, tasksToShow);
    } else {
      // If no tasks for the selected date, show a message
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
  }

  void _showTaskListDialog(DateTime selectedDate, List<Task> tasksToShow) {
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
                    _toggleTaskCompletion(task);
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

  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Code Daily!")),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: (day, focusedDay) {
              _loadTasksForSelectedDate(day);
            },
          ),
        ),
      ],
    );
  }
}
