import 'package:demo/models/user_preferences_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/hive_services.dart';
import '../ViewModel/user_preferences_view_model.dart';

final preferencesProvider = StateNotifierProvider<UserPreferencesViewModel, UserPreferences>(
      (ref) => UserPreferencesViewModel(HiveService()),
);
