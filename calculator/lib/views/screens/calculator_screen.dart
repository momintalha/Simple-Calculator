import 'package:calculator/views/screens/about_screen.dart';
import 'package:calculator/views/screens/history_screen.dart';
import 'package:calculator/views/widgets/app_button.dart';
import 'package:calculator/views/widgets/calculator_button_grid.dart';
import 'package:calculator/views/widgets/display_panel.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AboutScreen(),
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
