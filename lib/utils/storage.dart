import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PersistentStorage {
  SharedPreferences? _prefs;
  static PersistentStorage? _instance;

  PersistentStorage._pre(SharedPreferences prefs) {
    _prefs = prefs;
  }

  PersistentStorage.of() {
    _init();
  }

  void _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static PersistentStorage getInstance() {
    _instance ??= PersistentStorage.of();
    return _instance!;
  }

  static Future<PersistentStorage> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = PersistentStorage._pre(prefs);
    }
    return _instance!;
  }

  void setData<T>(String key, T data) {
    if (data is String) {
      _prefs?.setString(key, data);
    } else if (data is double) {
      _prefs?.setDouble(key, data);
    } else if (data is int) {
      _prefs?.setInt(key, data);
    } else if (data is bool) {
      _prefs?.setBool(key, data);
    } else if (data is List<String>) {
      _prefs?.setStringList(key, data);
    } else if (data is Map) {
      _prefs?.setString(key, json.encode(data));
    }
  }

  void remove(String key) {
    _prefs?.remove(key);
  }

  T? get<T>(String key) {
    dynamic value = _prefs?.get(key);
    if (value.runtimeType.toString() == "String") {
      if (_isJson(value)) {
        return json.decode(value) as T;
      } else {
        return value as T;
      }
    }
    return null;
  }

  /// 判断是否是json字符串
  _isJson(String value) {
    try {
      const JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
