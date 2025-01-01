import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Services/hive_services.dart';
import '../models/user_preferences_model.dart';

class UserPreferencesViewModel extends StateNotifier<UserPreferences> {
  final HiveService _hiveService;

  UserPreferencesViewModel(this._hiveService) : super(UserPreferences());

  Future<void> loadPreferences() async {
    state = await _hiveService.loadPreferences();
  }

  Future<void> updatePreferences(UserPreferences preferences) async {
    await _hiveService.savePreferences(preferences);
    state = preferences;
  }
}
