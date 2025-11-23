import 'package:mini_cash/entity/coin_entity.dart';

class CoinModel extends CoinEntity {
  final double price;

  const CoinModel({
    required super.symbol,
    required super.baseAsset,
    required super.quoteAsset,
    required this.price,
  });

  factory CoinModel.fromMap(Map<String, dynamic> map, double price) {
    return CoinModel(
      symbol: map['symbol'],
      baseAsset: map['baseAsset'],
      quoteAsset: map['quoteAsset'],
      price: price,
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      "symbol": symbol,
      "baseAsset": baseAsset,
      "quoteAsset": quoteAsset,
      "price": price,
    };
  }

  factory CoinModel.fromEntity(CoinEntity e, {double price = 0}) => CoinModel(
    symbol: e.symbol,
    baseAsset: e.baseAsset,
    quoteAsset: e.quoteAsset,
    price: price,
  );
}
