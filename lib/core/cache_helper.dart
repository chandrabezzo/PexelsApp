import 'dart:convert';
import 'package:pexels/data/models/photo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> putPhotos(List<PhotoModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> _dataList = list?.map((value) {
      return jsonEncode(value.toJson());
    })?.toList();
    return prefs.setStringList("photos", _dataList);
  }

  static Future<List<T>> getObject<T>(T f(Map v),
      {List<T> defValue = const []}) async {
    final prefs = await SharedPreferences.getInstance();
    List<Map> dataList = _getObjList(prefs, "photos");
    List<T> list = dataList?.map((value) {
      return f(value);
    })?.toList();
    return list ?? defValue;
  }

  static List<Map> _getObjList(SharedPreferences prefs, String key) {
    List<String> dataList = prefs.getStringList(key);
    return dataList?.map((value) {
      Map _dataMap = jsonDecode(value);
      return _dataMap;
    })?.toList();
  }
}