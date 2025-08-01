import 'package:flutter/material.dart';

import '../theme/palette.dart';
import '../theme/theme.dart';

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({
    super.key,
    this.onPressed,
    required this.tooltip,
  });

  final VoidCallback? onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.refresh_rounded,
        color: onPressed != null ? Palette.darkOrange : disabledColor,
      ),
      tooltip: tooltip,
    );
  }
}
