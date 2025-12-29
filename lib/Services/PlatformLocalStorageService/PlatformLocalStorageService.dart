import 'dart:convert';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/IPlatformLocalStorageService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformLocalStorageService implements IPlatformLocalStorageService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<void> addData<T>(String key, T value) async {
    try {
      final prefs = await _getPrefs();

      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else {
        await prefs.setString(key, jsonEncode(value));
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  @override
  Future<T?> getData<T>(String key) async {
    try {
      final prefs = await _getPrefs();
      final value = prefs.get(key);

      if (value == null) return null;
      if (value is T) return value as T;

      if (value is String) {
        return jsonDecode(value) as T;
      }
      return null;
    } on Exception catch (ex) {
      ex.logException();
      return null;
    }
  }

  @override
  Future<void> deleteData(String key) async {
    try {
      final prefs = await _getPrefs();
      await prefs.remove(key);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  @override
  Future<void> deleteAllData() async {
    try {
      final prefs = await _getPrefs();
      await prefs.clear();
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
