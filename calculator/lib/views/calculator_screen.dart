import 'package:calculator/views/result_history_screen.dart';
import 'package:calculator/views/widgets/app_button.dart';
import 'package:calculator/views/widgets/calculator_button_grid.dart';
import 'package:calculator/views/widgets/display_panel.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Drawer(
          backgroundColor: Colors.black54,
          width: MediaQuery.of(context).size.width * 0.85,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montono',
                  color: Colors.white,
                ),
                children: [
                  TextSpan(text: '➤ ', style: TextStyle(fontSize: 22)),
                  TextSpan(text: ' About\n'),
                  TextSpan(text: 'Calculator\n'),
                  TextSpan(
                    text:
                        'Version 1.0 (Built with Flutter)\nCopyright(c) 2026, All rights reserved.\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      color: Colors.white54,
                    ),
                  ),
                  TextSpan(text: '🤝 ', style: TextStyle(fontSize: 22)),
                  TextSpan(text: 'Support\n'),
                  TextSpan(
                    text:
                        'Please leave questions, comments or report bugs 🙂\n\nemail - mominpasha302@gmail.com\ntiktok - @appdev404',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontFamily: 'Montono', fontWeight: FontWeight.bold),
        ),
        actions: [
          AppButton(
            bicon: Icons.history,
            bColor: Colors.blue,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ResultHistoryScreen()),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.white,
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: DisplayPanel(),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CalcButtonGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
