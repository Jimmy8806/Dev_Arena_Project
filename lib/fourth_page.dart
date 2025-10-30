import 'package:flutter/material.dart';
import 'second_page.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> completedTasks;

  const CompletedTasksPage({super.key, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    final completedCount = completedTasks.length;
    final totalCount = completedTasks.length;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Completed Tasks',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(9, 9, 9, 1),
              ),
            ),
            const SizedBox(height: 35),

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
                  value: totalCount == 0 ? 0 : completedCount / totalCount,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$completedCount/$totalCount Tasks Completed',
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(30, 30, 30, 1),
              ),
            ),

            const SizedBox(height: 15),
            Align(
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

            Expanded(
              child: ListView.builder(
                itemCount: completedTasks.length,
                itemBuilder: (context, index) {
                  final task = completedTasks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        task.title,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          color: Color.fromRGBO(30, 30, 30, 1),
                        ),
                      ),
                      value: true,
                      onChanged: null,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
