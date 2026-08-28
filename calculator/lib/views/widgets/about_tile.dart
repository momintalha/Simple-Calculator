import 'package:flutter/material.dart';

class AboutTile extends StatelessWidget {
  final String icon;
  final double iSize;
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final TextStyle titleTextStyle;

  const AboutTile({
    super.key,
    required this.icon,
    required this.iSize,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: iSize,
          height: iSize,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(icon),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleTextStyle),
            Text(
              subtitle,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
