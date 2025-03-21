import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = "isDarkMode";

  // Check the stored theme mode or default to light mode
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read<bool>(_key) ?? false;

  void toggleTheme() {
    bool isDarkMode = !_loadTheme();
    _box.write(_key, isDarkMode);
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
