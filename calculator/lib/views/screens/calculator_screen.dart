import 'package:calculator/views/screens/about_screen.dart';
import 'package:calculator/views/screens/history_screen.dart';
import 'package:calculator/views/widgets/calculator_button_grid.dart';
import 'package:calculator/views/widgets/display_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AboutScreen(),
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ResultHistoryScreen()),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: DisplayPanel(),
              ),
            ),
            SizedBox(height: 20),
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
