import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;

  const CustomBackButton({
    @required this.color,
  }) : assert(color != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
      ),
      color: color,
      onPressed: () => Navigator.pop(context),
    );
  }
}
