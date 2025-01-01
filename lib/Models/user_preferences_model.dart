class UserPreferences {
  final bool isDarkMode;
  final String defaultSortOrder;

  UserPreferences({this.isDarkMode = false, this.defaultSortOrder = 'date'});

  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'defaultSortOrder': defaultSortOrder,
    };
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      isDarkMode: map['isDarkMode'] ?? false,
      defaultSortOrder: map['defaultSortOrder'] ?? 'date',
    );
  }
}
