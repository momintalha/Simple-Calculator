import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final Color? bColor;
  final Color? tColor;
  final bool onLongPress;

  const CalcButton({
    super.key,
    required this.label,
    required this.callback,
    this.tColor,
    this.bColor = Colors.white,
    this.onLongPress = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      onLongPress: (onLongPress)
          ? () {
              callback();
            }
          : null,
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
