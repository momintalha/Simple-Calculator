import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalcButtonGrid extends StatelessWidget {
  CalcButtonGrid({super.key});

  final List<String> buttonGrid = [
    'AC',
    '⌫',
    '%',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    var calcP = Provider.of<CalculatorProvider>(context);
    var hisP = Provider.of<HistoryProvider>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bWidth = (constraints.maxWidth - (5 * 3)) / 4;
        final bHeight = (constraints.maxHeight - (10 * 4)) / 5;
        final aspectRatio = bWidth / bHeight;
        return GridView.builder(
          itemCount: buttonGrid.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) {
            switch (buttonGrid[index]) {
              case 'AC':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.blue,
                  bColor: AppColors().calcButtonColor,
                  onTap: () {
                    calcP.onTapAC();
                  },
                );
              case '⌫':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.blue,
                  bColor: AppColors().calcButtonColor,
                  onTap: () {
                    calcP.onTapRemove();
                  },
                  onLongTap: () {
                    calcP.onTapRemove();
                  },
                );
              case '=':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.white,
                  bColor: Colors.blue,
                  onTap: () {
                    calcP.onTapEqual(
                      hisP,
                      DateFormat('hh:mm:s a').format(DateTime.now()),
                    );
                  },
                );
              case '0' ||
                  '00' ||
                  '1' ||
                  '2' ||
                  '3' ||
                  '4' ||
                  '5' ||
                  '6' ||
                  '7' ||
                  '8' ||
                  '9':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.black54,
                  bColor: Colors.white,
                  onTap: () {
                    calcP.appendNumber(calcButtonValue: buttonGrid[index]);
                  },
                );
              case '%' || '÷' || '×' || '-' || '+':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.blue,
                  bColor: AppColors().calcButtonColor,
                  onTap: () {
                    calcP.appendOperator(operator: buttonGrid[index]);
                  },
                );
              case '.':
                return CalcButton(
                  label: buttonGrid[index],
                  tColor: Colors.black54,
                  bColor: Colors.white,
                  onTap: () {
                    calcP.appendDot();
                  },
                );
              default:
                return null;
            }
          },
        );
      },
    );
  }
}
