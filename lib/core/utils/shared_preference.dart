import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getDataFromSharedPreferences({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveDataSharedPreferences(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setStringList(key, value);
    }
  }

  static Future<bool> removeFromSharedPreferences({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> clearSharedPreferences() {
    return sharedPreferences.clear();
  }
}
