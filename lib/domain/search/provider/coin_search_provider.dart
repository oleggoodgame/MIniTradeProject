import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/domain/search/model/coin_model.dart';
import 'package:mini_cash/domain/search/repository/search_repository.dart';

// Це provider, який повертає CoinModel із останньою ціною
final coinSearchProvider = FutureProvider.family<List<CoinModel>, String>((ref, query) async {
  if (query.isEmpty) return [];

  final repo = ref.read(coinsRepositoryProvider);
  final coins = await repo.searchCoins(query);

  // Якщо allPricesProvider вже має value — використаємо його швидко
  final pricesAsync = ref.read(allPricesProvider);
  Map<String,double> prices = {};
  if (pricesAsync is AsyncData<Map<String,double>>) {
    prices = pricesAsync.value;
  } else {
    // Якщо нема — дочекаємось першого (опціонально, можна пропустити)
    prices = await ref.watch(allPricesProvider.future);
  }

  return coins.map((coin) => CoinModel.fromEntity(coin, price: prices[coin.symbol] ?? 0)).toList();
});


final allPricesProvider = StreamProvider<Map<String, double>>((ref) async* {
  while (true) {
    final prices = await fetchAllPrices();
    yield prices;

    await Future.delayed(Duration(seconds: 10));
  }
});

Future<Map<String, double>> fetchAllPrices() async {
  final url = Uri.parse('https://api.binance.com/api/v3/ticker/price');

  final response = await http.get(url);
  if (response.statusCode != 200) return {};

  final List data = jsonDecode(response.body);

  final Map<String, double> prices = {};

  for (var item in data) {
    final symbol = item['symbol'];
    final price = double.tryParse(item['price']) ?? 0;
    prices[symbol] = price;
  }

  return prices;
}
