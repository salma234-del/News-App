import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;
  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required bool value,
  }) async {
    return await sharedPref.setBool(key, value);
  }

  static bool? getData({
    required String key,
  }) {
    return sharedPref.getBool(key);
  }
  
  
  
}
