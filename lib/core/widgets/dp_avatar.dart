import 'package:flutter/material.dart';

class DPAvatar extends StatelessWidget {
  final String initials;
  final String? imageUrl;
  final double size;
  final Color? backgroundColor;
  const DPAvatar({super.key, required this.initials, this.imageUrl, this.size = 40, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? Text(initials) : null,
    );
  }
}
