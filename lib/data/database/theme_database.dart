import 'package:flutter_riverpod/legacy.dart';
import 'package:mini_cash/data/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

enum AppThemeMode {
  light,
  dark;

  static AppThemeMode fromString(String value) {
    return value == 'dark'
        ? AppThemeMode.dark
        : AppThemeMode.light;
  }

  String get value => name;
}
final themeControllerProvider =
    StateNotifierProvider<ThemeController, AppThemeMode>((ref) {
  final db = AppDatabase.instance;
  final dataSource = ThemeLocalDataSource(db);
  return ThemeController(dataSource);
});

class ThemeLocalDataSource {
  final AppDatabase db;

  ThemeLocalDataSource(this.db);

  Future<void> saveTheme(AppThemeMode theme) async {
    final database = await db.database;

    await database.insert(
      'settings',
      {'key': 'theme', 'value': theme.value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<AppThemeMode> getTheme() async {
    final database = await db.database;

    final result = await database.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['theme'],
      limit: 1,
    );

    if (result.isEmpty) {
      return AppThemeMode.light; // дефолт
    }

    return AppThemeMode.fromString(result.first['value'] as String);
  }
}
class ThemeController extends StateNotifier<AppThemeMode> {
  final ThemeLocalDataSource dataSource;

  ThemeController(this.dataSource) : super(AppThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    state = await dataSource.getTheme();
  }

  Future<void> toggleTheme() async {
    final newTheme =
        state == AppThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark;

    state = newTheme;
    await dataSource.saveTheme(newTheme);
  }
}
