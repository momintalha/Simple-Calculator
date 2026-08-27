import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AppLifeCycleHandler extends StatefulWidget {
  final Widget child;
  const AppLifeCycleHandler(this.child, {super.key});

  @override
  State<AppLifeCycleHandler> createState() => _AppLifeCycleHandlerState();
}

class _AppLifeCycleHandlerState extends State<AppLifeCycleHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      final calcP = Provider.of<CalculatorProvider>(context, listen: false);
      calcP.saveBeforeClose();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
