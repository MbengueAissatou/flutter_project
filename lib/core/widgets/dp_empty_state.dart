import 'package:doctorpoint/core/widgets/dp_button.dart';
import 'package:flutter/material.dart';

class DPEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  const DPEmptyState({super.key, required this.title, required this.subtitle, required this.icon, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 56),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          Text(subtitle, textAlign: TextAlign.center),
          if (actionLabel != null) ...[
            const SizedBox(height: 12),
            DPButton(label: actionLabel!, onPressed: onAction),
          ]
        ]),
      ),
    );
  }
}
