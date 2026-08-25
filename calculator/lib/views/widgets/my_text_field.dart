import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final int maxLines;
  final Alignment alignment;
  final double tFontSize;
  final Color tColor;

  const MyTextField(
    this.text, {
    super.key,
    required this.maxLines,
    required this.alignment,
    required this.tFontSize,
    required this.tColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: AutoSizeText(
        text,
        textDirection: TextDirection.ltr,
        maxLines: maxLines,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
