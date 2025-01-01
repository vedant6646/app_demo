import 'package:hive/hive.dart';
import '../models/user_preferences_model.dart';

class HiveService {
  static const _boxName = 'userPreferences';

  Future<void> savePreferences(UserPreferences preferences) async {
    final box = await Hive.openBox(_boxName);
    await box.put('preferences', preferences.toMap());
  }

  Future<UserPreferences> loadPreferences() async {
    final box = await Hive.openBox(_boxName);
    final map = box.get('preferences');
    return map != null ? UserPreferences.fromMap(map) : UserPreferences();
  }
}
