import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final IconData bicon;
  final Color bColor;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.bicon,
    required this.bColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        iconSize: 24,
        backgroundColor: Colors.white,
        shadowColor: Colors.black45,
        shape: CircleBorder(),
        elevation: 2,
      ),
      child: Icon(bicon, color: bColor),
    );
  }
}
