import 'package:calculator/models/calculator_model.dart';
import 'package:calculator/services/clipboard_service.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/services/shared_preferences.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorProvider() {
    loadOnStartup();
  }

  final String _operators = '+-×÷%.';
  final CalculatorModel _calculatorModel = CalculatorModel();
  final PreferencesService _prefsService = PreferencesService();
  final ClipboardService _clipboardService = ClipboardService();

  bool _isdot = true;

  String get input => _calculatorModel.input;
  String get output => _calculatorModel.output;
  bool get isResultShown => _calculatorModel.isResultShown;

  void appendOperator({required String operator}) {
    if (_calculatorModel.input.length > 99) return;

    _calculatorModel.isResultShown = false;
    _isdot = true;

    if (_calculatorModel.input.isEmpty) {
      if (operator == '-') {
        _calculatorModel.input = '-';
      }
      return;
    }

    final last = _calculatorModel.input[_calculatorModel.input.length - 1];

    // Prevent duplicate operators.
    if (last == operator) {
      return;
    }

    // Prevent "-+" / "-*" etc. at the beginning.
    if (_calculatorModel.input.length == 1 && last == '-') {
      return;
    }

    // Replace an existing operator.
    if (_operators.contains(last)) {
      _calculatorModel.input = _calculatorModel.input.substring(
        0,
        _calculatorModel.input.length - 1,
      );
    }

    _calculatorModel.input += operator;

    notifyListeners();
  }

  void appendNumber({required String calcButtonValue}) {
    if (_calculatorModel.input.length > 99) return;

    _calculatorModel.isResultShown = false;

    _calculatorModel.input += calcButtonValue;
    _calculatorModel.output = '${_exprEvaluation()}';
    notifyListeners();
  }

  void appendDot() {
    if (_calculatorModel.input.length > 99) return;

    _calculatorModel.isResultShown = false;

    if (_isdot && _calculatorModel.input.isNotEmpty) {
      _calculatorModel.input += '.';
      _isdot = false;
    }

    notifyListeners();
  }

  void onTapEqual(HistoryProvider provider) {
    if (_calculatorModel.isResultShown) return;
    _calculatorModel.isResultShown = true;
    if (_calculatorModel.input.isNotEmpty &&
        _calculatorModel.output.isNotEmpty) {
      provider.addHistory(
        calc: _calculatorModel.input,
        res: _calculatorModel.output,
      );
    }

    notifyListeners();
  }

  void onTapAC() {
    _calculatorModel.isResultShown = false;
    _calculatorModel.input = '';
    _calculatorModel.output = '0';
    _isdot = true;
    notifyListeners();
  }

  void onTapRemove() {
    _calculatorModel.isResultShown = false;

    if (_calculatorModel.input.length <= 1) {
      _calculatorModel.input = '';
      _calculatorModel.output = '0';
      _isdot = true;
      notifyListeners();
      return;
    }

    _calculatorModel.input = _calculatorModel.input.substring(
      0,
      _calculatorModel.input.length - 1,
    );

    if (_operators.contains(
      _calculatorModel.input[_calculatorModel.input.length - 1],
    )) {
      _calculatorModel.output =
          '${_exprEvaluation(_calculatorModel.input.substring(0, _calculatorModel.input.length - 1))}';
    } else {
      _calculatorModel.output = '${_exprEvaluation()}';
    }

    notifyListeners();
  }

  String? _exprEvaluation([String? s]) {
    String? temp = (s != null)
        ? s.replaceAll('×', '*').replaceAll('÷', '/')
        : _calculatorModel.input.replaceAll('×', '*').replaceAll('÷', '/');

    ExpressionParser parser = GrammarParser();
    Expression expr = parser.parse(temp);
    var context = ContextModel();
    var evaluator = RealEvaluator(context);

    temp = evaluator.evaluate(expr).toString();

    if (temp == 'Infinity' || temp == 'NaN') {
      return "Can't divide by zero";
    }

    if (temp.contains('.')) {
      if (temp.endsWith('.0')) {
        return temp.substring(0, temp.length - 2);
      }

      if (temp.contains('e')) {
        return temp.substring(0, 8) +
            temp.substring(temp.indexOf('e'), temp.length);
      }

      if (temp.length > 10) {
        return temp.substring(0, 10);
      }
    }

    return temp;
  }

  Future<void> loadOnStartup() async {
    final savedData = await _prefsService.load();
    if (!savedData.values.contains(null)) {
      _calculatorModel.input = savedData[PreferencesService.calc]!;
      _calculatorModel.output = savedData[PreferencesService.res]!;
    }
    notifyListeners();
  }

  Future<void> saveBeforeClose() async {
    await _prefsService.save(
      calculation: _calculatorModel.input,
      result: _calculatorModel.output,
    );
  }

  void historyBack(String calc, String res) {
    _calculatorModel.input = calc;
    _calculatorModel.output = res;
    notifyListeners();
  }

  Future<void> copyText({required String data}) async {
    await _clipboardService.copyClipboardText(data: data);
  }
}
