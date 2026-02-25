import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum DPButtonVariant { primary, outlined, danger, ghost, secondary }

class DPButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final DPButtonVariant variant;
  const DPButton({super.key, required this.label, this.onPressed, this.variant = DPButtonVariant.primary});

  @override
  Widget build(BuildContext context) {
    final style = switch (variant) {
      DPButtonVariant.primary => FilledButton.styleFrom(backgroundColor: AppColors.primary),
      DPButtonVariant.secondary => FilledButton.styleFrom(backgroundColor: AppColors.secondary),
      DPButtonVariant.danger => FilledButton.styleFrom(backgroundColor: AppColors.error),
      DPButtonVariant.outlined => OutlinedButton.styleFrom(),
      DPButtonVariant.ghost => TextButton.styleFrom(),
    };
    final child = Text(label);
    return SizedBox(
      width: double.infinity,
      child: variant == DPButtonVariant.outlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: child)
          : variant == DPButtonVariant.ghost
              ? TextButton(onPressed: onPressed, style: style, child: child)
              : FilledButton(onPressed: onPressed, style: style, child: child),
    );
  }
}
