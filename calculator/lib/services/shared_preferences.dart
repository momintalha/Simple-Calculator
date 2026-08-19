import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const calc = 'calcuatoion';
  static const res = 'result';

  Future<void> save({
    required String calculation,
    required String result,
  }) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString(calc, calculation);
    await pref.setString(res, result);
  }

  Future<Map<String, String?>> load() async {
    final pref = await SharedPreferences.getInstance();

    return {calc: pref.getString(calc), res: pref.getString(res)};
  }
}
