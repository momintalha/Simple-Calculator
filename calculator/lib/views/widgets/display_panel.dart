import 'package:calculator/utils/app_colors.dart';
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
        return Container(
          decoration: BoxDecoration(
            color: AppColors().displayPanelcolor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: MyTextField(
                    value.input,
                    maxLines: 3,
                    alignment: Alignment.bottomRight,
                    tFontSize: 40,
                    tColor: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: MyTextField(
                    '= ${value.output}',
                    maxLines: 1,
                    alignment: Alignment.centerRight,
                    tFontSize: (value.isResultShown) ? 40 : 30,
                    tColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
