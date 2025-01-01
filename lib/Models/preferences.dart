import 'package:flutter/material.dart';

class Preferences {
  ThemeMode themeMode;
  String sortOrder;

  Preferences({this.themeMode = ThemeMode.light, this.sortOrder = 'date'});

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode == ThemeMode.light ? 'light' : 'dark',
      'sortOrder': sortOrder,
    };
  }

  factory Preferences.fromMap(Map<String, dynamic> map) {
    return Preferences(
      themeMode: map['themeMode'] == 'light' ? ThemeMode.light : ThemeMode.dark,
      sortOrder: map['sortOrder'],
    );
  }
}