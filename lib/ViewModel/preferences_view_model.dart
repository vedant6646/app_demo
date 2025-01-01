import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PreferencesViewModel extends StateNotifier<Map<String, dynamic>> {
  static const String _boxName = 'preferences';

  PreferencesViewModel() : super({}) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final box = await Hive.openBox(_boxName);
    state = {
      'theme': box.get('theme', defaultValue: 'light'),
      'sortOrder': box.get('sortOrder', defaultValue: 'date'),
    };
  }

  Future<void> updateTheme(String theme) async {
    final box = await Hive.openBox(_boxName);
    box.put('theme', theme);
    state = {...state, 'theme': theme};
  }

  Future<void> updateSortOrder(String sortOrder) async {
    final box = await Hive.openBox(_boxName);
    box.put('sortOrder', sortOrder);
    state = {...state, 'sortOrder': sortOrder};
  }
}

final preferencesProvider =
StateNotifierProvider<PreferencesViewModel, Map<String, dynamic>>(
        (ref) => PreferencesViewModel());
