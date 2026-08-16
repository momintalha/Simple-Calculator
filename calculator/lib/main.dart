import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorProvider>(
          create: (context) => CalculatorProvider(),
        ),
        ChangeNotifierProvider<HistoryProvider>(
          create: (context) => HistoryProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A calculator with basic operations.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
        textTheme: TextTheme(
          labelMedium: TextStyle(
            fontSize: 40,
            color: Colors.black87,
            fontFamily: 'Montono',
          ),
        ),
      ),
      home: const CalculatorScreen(),
    );
  }
}
