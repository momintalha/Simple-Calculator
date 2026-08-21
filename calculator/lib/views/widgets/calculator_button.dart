import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final Color? bColor;
  final Color? tColor;
  final VoidCallback onTap;
  final VoidCallback? onLongTap;

  const CalcButton({
    super.key,
    required this.label,
    required this.onTap,
    this.tColor,
    this.bColor = Colors.white,
    this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      onLongPress: () {
        if (onLongTap != null) onLongTap!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: tColor,
          fontSize: 18,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
