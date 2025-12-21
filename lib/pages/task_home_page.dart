import 'package:flutter/material.dart';
import '../data/task_data.dart';
import '../widgets/task_card.dart';
import '../widgets/task_filter_tabs.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  int selectedIndex = 1;

  List<Map<String, dynamic>> get filteredTasks {
    if (selectedIndex == 0) return allTasks;
    if (selectedIndex == 1) {
      return allTasks.where((t) => t['category'] == 'today').toList();
    }
    return allTasks.where((t) => t['category'] == 'upcoming').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.notifications_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Good Morning',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          TaskFilterTabs(
            selectedIndex: selectedIndex,
            filters: filters,
            onSelected: (index) {
              setState(() => selectedIndex = index);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                return TaskCard(task: filteredTasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
