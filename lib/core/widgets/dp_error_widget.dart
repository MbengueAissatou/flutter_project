import 'package:doctorpoint/core/widgets/dp_button.dart';
import 'package:flutter/material.dart';

class DPErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const DPErrorWidget({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [Text(message), const SizedBox(height: 8), DPButton(label: 'Réessayer', onPressed: onRetry)]),
    );
  }
}
