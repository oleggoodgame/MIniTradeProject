import 'package:mini_cash/data/database/sql_database.dart';

class CoinsLocalDataSource {
  final CoinsDatabase db = CoinsDatabase.instance;

  CoinsLocalDataSource();

  Future<void> replaceAll(List<Map<String, String>> coins) async {
    final database = await db.database;

    await database.delete('coins');

    for (var c in coins) {
      await database.insert('coins', c);
    }
  }

  Future<List<Map<String, dynamic>>> readAll() async {
    final database = await db.database;
    return await database.query('coins');
  }

  Future<List<Map<String, dynamic>>> searchBase(String query) async {
    final database = await db.database;
    return await database.query(
      'coins',
      where: 'baseAsset LIKE ?',
      whereArgs: ['${query.toUpperCase()}%'],
    );
  }
}
