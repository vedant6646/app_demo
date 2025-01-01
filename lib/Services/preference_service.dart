import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Models/Preferences.dart';

class PreferencesService {
  final _preferencesBox = Hive.box('preferences');

  Preferences getPreferences() {
    final themeMode = _preferencesBox.get('themeMode', defaultValue: 'light') == 'light' ? ThemeMode.light : ThemeMode.dark;
    final sortOrder = _preferencesBox.get('sortOrder', defaultValue: 'date');
    return Preferences(themeMode: themeMode, sortOrder: sortOrder);
  }

  void savePreferences(Preferences preferences) {
    _preferencesBox.put('themeMode', preferences.themeMode == ThemeMode.light ? 'light' : 'dark');
    _preferencesBox.put('sortOrder', preferences.sortOrder);
  }
}