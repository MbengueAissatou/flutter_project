import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum DPBadgeVariant { success, warning, error, info, neutral }

class DPBadge extends StatelessWidget {
  final String label;
  final DPBadgeVariant variant;
  final bool dot;
  const DPBadge({super.key, required this.label, this.variant = DPBadgeVariant.neutral, this.dot = false});

  @override
  Widget build(BuildContext context) {
    final color = switch (variant) {
      DPBadgeVariant.success => AppColors.success,
      DPBadgeVariant.warning => AppColors.warning,
      DPBadgeVariant.error => AppColors.error,
      DPBadgeVariant.info => AppColors.primary,
      DPBadgeVariant.neutral => Colors.grey,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(.1), borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [if (dot) ...[Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)), const SizedBox(width: 4)], Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600))]),
    );
  }
}
