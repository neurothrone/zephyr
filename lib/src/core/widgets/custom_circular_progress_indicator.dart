import 'package:flutter/material.dart';

import '../theme/palette.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Palette.lightOrange,
      ),
    );
  }
}
