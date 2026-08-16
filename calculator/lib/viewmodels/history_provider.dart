import 'package:flutter/material.dart';
import 'package:calculator/services/database_service.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider() {
    loadHistory();
  }

  List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get history => _history;

  void loadHistory() async {
    _history = await DatabaseService.dbService.fetch();
    notifyListeners();
  }

  void deleteHistory() async {
    bool? check = await DatabaseService.dbService.delete();

    if (check!) {
      _history = [];
      notifyListeners();
    }
  }

  void addHistory({
    required String calc,
    required String res,
    required String t,
  }) async {
    bool? check = await DatabaseService.dbService.insert(
      calculation: calc,
      result: res,
      time: t,
    );
    debugPrint('$check');
    if (check!) {
      loadHistory();
    }
  }
}
