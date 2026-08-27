import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final bool isLarge;

  const MyTextField(
    this.text, {
    super.key,
    required this.maxLines,
    this.textAlign = TextAlign.right,
    this.isLarge = true,
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
        style: (isLarge)
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
