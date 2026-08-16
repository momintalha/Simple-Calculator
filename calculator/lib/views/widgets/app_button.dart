import 'package:calculator/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final IconData bShape;
  final Color bColor;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.bShape,
    required this.bColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors().appButtonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(bShape, color: bColor, size: 28),
      ),
    );
  }
}
