import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<void> saveData({required String key,required String value})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getData({required String key})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeData({required String key})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}