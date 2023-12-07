import 'package:flutter/material.dart';

void main() {
  runApp(PMCPage());
}

class Task {
  String title;
  String description;
  bool isCompleted;

  Task(this.title, this.description, {this.isCompleted = false});
}

class PMCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> pendingTasks = [];
  List<Task> missingTasks = [];
  List<Task> completedTasks = [];

  void addTaskToPending(String title, String description) {
    setState(() {
      pendingTasks.add(Task(title, description));
    });
  }

  void addTaskToMissing(String title, String description) {
    setState(() {
      missingTasks.add(Task(title, description));
    });
  }

  void addTaskToCompleted(String title, String description) {
    setState(() {
      completedTasks.add(Task(title, description, isCompleted: true));
    });
  }

  void editTask(Task task, String title, String description) {
    setState(() {
      task.title = title;
      task.description = description;
    });
  }

  void deleteTask(List<Task> tasks, Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Task List'),
      ),
      body: Column(
        children: [
          _buildTaskSection("Pending Tasks", pendingTasks),
          _buildTaskSection("Missing Tasks", missingTasks),
          _buildTaskSection("Completed Tasks", completedTasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 133, 102, 188),
      ),
    );
  }

  Widget _buildTaskSection(String title, List<Task> tasks) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditTaskDialog(task);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteTask(tasks, task);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        Divider(),
      ],
    );
  }

  void _showTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';

        return AlertDialog(
          title: Text('Add a Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(labelText: 'Task Description'),
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      addTaskToPending(title, description);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add to Pending'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      addTaskToMissing(title, description);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add to Missing'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      addTaskToCompleted(title, description);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add to Completed'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditTaskDialog(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = task.title;
        String description = task.description;

        return AlertDialog(
          title: Text('Edit Task'),
          backgroundColor: const Color.fromARGB(255, 133, 102, 188),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: title),
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                controller: TextEditingController(text: description),
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(labelText: 'Task Description'),
              ),
              ElevatedButton(
                onPressed: () {
                  editTask(task, title, description);
                  Navigator.of(context).pop();
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
