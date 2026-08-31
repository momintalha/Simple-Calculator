import 'package:calculator/views/widgets/copyable_text.dart';
import 'package:calculator/views/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:provider/provider.dart';

class DisplayPanel extends StatelessWidget {
  const DisplayPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, calcP, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 10,
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: MyTextField(
                  calcP.input,
                  maxLines: 7,
                  textAlign: TextAlign.right,
                  textStyle: (calcP.isResultShown)
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            CopyableText(
              text: calcP.output,
              child: FittedBox(
                child: MyTextField(
                  '= ${calcP.output}',
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  textStyle: (calcP.isResultShown)
                      ? Theme.of(context).textTheme.displayMedium
                      : Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
