import 'package:calculator/bootstrap/app_life_cycle_handler.dart';
import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  final calcP = CalculatorProvider();
  await calcP.loadOnStartup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: calcP),
        ChangeNotifierProvider<HistoryProvider>(
          create: (context) => HistoryProvider(),
        ),
      ],
      child: AppLifeCycleHandler(const MyApp()),
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
