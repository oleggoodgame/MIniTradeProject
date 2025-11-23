class CoinEntity {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;
  const CoinEntity({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });

  Map<String, dynamic> toMap() {
    return {"symbol": symbol, "baseAsset": baseAsset, "quoteAsset": quoteAsset};
  }

  factory CoinEntity.fromMap(Map<String, dynamic> map) {
    return CoinEntity(
      symbol: (map['symbol'] ?? map['Symbol'] ?? '').toString(),
      baseAsset: (map['baseAsset'] ?? map['base'] ?? map['BaseAsset'] ?? '')
          .toString(),
      quoteAsset: (map['quoteAsset'] ?? map['quote'] ?? '').toString(),
    );
  }
}
