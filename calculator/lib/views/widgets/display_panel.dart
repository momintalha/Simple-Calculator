import 'package:calculator/views/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:provider/provider.dart';

class DisplayPanel extends StatelessWidget {
  const DisplayPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, value, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 10,
          children: [
            Expanded(
              child: MyTextField(
                value.input,
                maxLines: 4,
                textAlign: TextAlign.right,
                isLarge: false,
              ),
            ),
            FittedBox(
              child: MyTextField(
                '= ${value.output}',
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        );
      },
    );
  }
}
