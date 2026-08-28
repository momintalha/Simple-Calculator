import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const MyTextField(
    this.text, {
    super.key,
    required this.maxLines,
    required this.textStyle,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Text(
        text,
        textDirection: TextDirection.ltr,
        textAlign: textAlign,
        softWrap: true,
        maxLines: maxLines,
        style: textStyle,
      ),
    );
  }
}
