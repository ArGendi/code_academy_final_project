import 'package:shared_preferences/shared_preferences.dart';

class Cache{
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async{
    await sharedPreferences.setString('token', token);
  }

  static String? getToken(){
    return sharedPreferences.getString('token');
  }

  

  void removeToken(){
    sharedPreferences.remove('token');
  }

  static Future<void> saveId(int id) async{
    await sharedPreferences.setInt('id', id);
  }

  static int? getId(){
    return sharedPreferences.getInt('id');
  }

  static Future<void> saveKey(String key, String value) async{
    await sharedPreferences.setString(key, value);
  }

  static String? getKey(String key){
    return sharedPreferences.getString(key);
  }

  static Future<void> removeCache() async{
    await sharedPreferences.clear();
  }

}