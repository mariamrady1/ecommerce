import 'package:shared_preferences/shared_preferences.dart';

class HelperSharedPreference {
  static SharedPreferences? sharedPreferences;
  // ignore: non_constant_identifier_names
  static Future<void> Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getString({required String key})  {
    return sharedPreferences?.getString(key);
  }

  static setString({required String key, required String value}) async {
    await sharedPreferences?.setString(key, value);
  }
}
