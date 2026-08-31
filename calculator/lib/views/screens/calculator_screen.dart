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
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.blue)),
        centerTitle: false,
        actions: [
          IconButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AboutScreen()));
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 16,
                    bottom: 18,
                  ),
                  child: DisplayPanel(),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  spacing: 3,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {},
                          icon: Icon(Icons.settings),
                        ),
                        IconButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ResultHistoryScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.history),
                        ),
                      ],
                    ),
                    Expanded(child: CalcButtonGrid()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
