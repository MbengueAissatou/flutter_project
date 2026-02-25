import 'package:flutter/material.dart';

class DPStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;
  const DPStatCard({super.key, required this.title, required this.value, required this.icon, required this.color, required this.trend});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: color),
          const Spacer(),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          Text(title),
          Text(trend, style: TextStyle(color: color)),
        ]),
      ),
    );
  }
}
