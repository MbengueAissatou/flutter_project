import 'package:flutter/material.dart';

final List<Map<String, dynamic>> filters = [
  {'label': 'All', 'count': 10},
  {'label': 'Today Task', 'count': 8},
  {'label': 'Upcoming', 'count': 2},
];

final List<Map<String, dynamic>> allTasks = [
  {
    'title': 'Mobile App Design',
    'progress': '20/45 Screens Completed',
    'color': Colors.amber.shade100,
    'date': '15 Dec',
    'avatars': 3,
    'category': 'today',
  },
  {
    'title': 'Website Redesign',
    'progress': '12/30 Pages Done',
    'color': Colors.pink.shade50,
    'date': '18 Dec',
    'avatars': 4,
    'category': 'today',
  },
  {
    'title': 'Marketing Campaign',
    'progress': '0/10 Materials',
    'color': Colors.red.shade50,
    'date': '05 Jan',
    'avatars': 2,
    'category': 'upcoming',
  },
];
