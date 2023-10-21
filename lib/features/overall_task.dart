import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  final String title;
  final String description;
  final DateTime date;
  bool isCompleted = false;

  Task(this.title, this.description, this.date);
}

class TaskListApp extends StatefulWidget {
  const TaskListApp({super.key});

  @override
  _TaskListAppState createState() => _TaskListAppState();
}

class _TaskListAppState extends State<TaskListApp> {
  List<Task> tasks = [];

  void addTask(String title, String description, DateTime date) {
    setState(() {
      tasks.add(Task(title, description, date));
    });
  }

  void completeTask(Task task) {
    setState(() {
      task.isCompleted = true;
    });
  }

  void updateStatus() {
    final now = DateTime.now();
    for (var task in tasks) {
      if (task.date.isBefore(now) && !task.isCompleted) {
        task.isCompleted = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateStatus();
    int pendingTasks = tasks
        .where((task) => !task.isCompleted && task.date.isAfter(DateTime.now()))
        .length;
    int completedTasks = tasks.where((task) => task.isCompleted).length;
    int missedTasks = tasks
        .where(
            (task) => !task.isCompleted && task.date.isBefore(DateTime.now()))
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TaskCountBox("Pending", pendingTasks, Colors.blue),
                TaskCountBox("Completed", completedTasks, Colors.green),
                TaskCountBox("Missed", missedTasks, Colors.red),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                bool isCompleted =
                    task.isCompleted || task.date.isBefore(DateTime.now());

                return TaskListItem(
                  task: task,
                  isCompleted: isCompleted,
                  completeTask: () {
                    completeTask(task);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(
                addTask: addTask,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskCountBox extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const TaskCountBox(this.label, this.count, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }
}

class TaskListItem extends StatelessWidget {
  final Task task;
  final bool isCompleted;
  final VoidCallback completeTask;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.isCompleted,
    required this.completeTask,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMd().format(task.date);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.assignment,
            color: isCompleted ? Colors.green : Colors.red),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Due Date: $formattedDate',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              task.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.check),
          color: isCompleted ? Colors.grey : Colors.green,
          onPressed: isCompleted ? null : completeTask,
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  final Function(String, String, DateTime) addTask;

  const AddTaskScreen({super.key, required this.addTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(controller: titleController),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(controller: descriptionController),
            const SizedBox(height: 16),
            const Text(
              'Due Date:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date Chosen'
                      : '${selectedDate?.toLocal()}'.split(' ')[0],
                  style: const TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text(
                    'Choose Date',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addTask(titleController.text, descriptionController.text,
              selectedDate ?? DateTime.now());
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
