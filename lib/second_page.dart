import 'package:flutter/material.dart';
import 'fourth_page.dart';
import 'third_page.dart';

class Task {
  String title;
  bool isCompleted;
  Task({required this.title, this.isCompleted = false});
}

class TaskProgressScreen extends StatefulWidget {
  const TaskProgressScreen({super.key});

  @override
  State<TaskProgressScreen> createState() => _TaskProgressScreenState();
}

class _TaskProgressScreenState extends State<TaskProgressScreen> {
  final List<Task> _tasks = List.generate(
    15,
    (index) => Task(title: 'Design New UI For Dashboard'),
  );

  double get _progressValue =>
      _tasks.where((task) => task.isCompleted).length / _tasks.length;

  int get _completedCount => _tasks.where((task) => task.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Ali',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(9, 9, 9, 1),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Monday, July 14',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Day Progress',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(9, 9, 9, 1),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 6,
                    child: LinearProgressIndicator(
                      value: _progressValue,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$_completedCount / ${_tasks.length} Tasks Completed',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(144, 161, 185, 1),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    value: task.isCompleted,
                    activeColor: Colors.blue,
                    onChanged: (bool? newValue) {
                      if (newValue == null) return;
                      setState(() {
                        _tasks[index].isCompleted = newValue;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => AddBottomSheet(),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Home is selected
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        onTap: (index) {
          if (index == 1) {
            final completedTasks = _tasks
                .where((task) => task.isCompleted)
                .toList();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CompletedTasksPage(completedTasks: completedTasks),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline, size: 28),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
