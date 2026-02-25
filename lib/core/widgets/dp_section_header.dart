import 'package:flutter/material.dart';

class DPSectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  const DPSectionHeader({super.key, required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(title, style: Theme.of(context).textTheme.titleMedium), const Spacer(), if (actionLabel != null) TextButton(onPressed: onAction, child: Text(actionLabel!))]);
  }
}
