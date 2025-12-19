class TickerEntity {
  final String eventType; // e
  final int eventTime; // E
  final String symbol; // s
  final double priceChange; // p
  final double priceChangePercent; // P
  final double weightedAvgPrice; // w
  final double lastPrice; // c
  final double lastQty; // Q
  final double bidPrice; // b
  final double bidQty; // B
  final double askPrice; // a
  final double askQty; // A
  final double highPrice; // h
  final double lowPrice; // l

  TickerEntity({
    required this.eventType,
    required this.eventTime,
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.highPrice,
    required this.lowPrice,
  });

  factory TickerEntity.fromWsJson(Map<String, dynamic> json) {
    return TickerEntity(
      eventType: json['e'],
      eventTime: json['E'],
      symbol: json['s'],
      priceChange: double.parse(json['p']),
      priceChangePercent: double.parse(json['P']),
      weightedAvgPrice: double.parse(json['w']),
      lastPrice: double.parse(json['c']),
      lastQty: double.parse(json['Q']),
      bidPrice: double.parse(json['b']),
      bidQty: double.parse(json['B']),
      askPrice: double.parse(json['a']),
      askQty: double.parse(json['A']),
      highPrice: double.parse(json['h']),
      lowPrice: double.parse(json['l']),
    );
  }

  factory TickerEntity.fromRestJson(Map<String, dynamic> json) {
    return TickerEntity(
      eventType: 'REST',
      eventTime: DateTime.now().millisecondsSinceEpoch,
      symbol: json['symbol'],
      priceChange: double.parse(json['priceChange']),
      priceChangePercent: double.parse(json['priceChangePercent']),
      weightedAvgPrice: double.parse(json['weightedAvgPrice']),
      lastPrice: double.parse(json['lastPrice']),
      lastQty: double.parse(json['lastQty']),
      bidPrice: double.parse(json['bidPrice']),
      bidQty: double.parse(json['bidQty']),
      askPrice: double.parse(json['askPrice']),
      askQty: double.parse(json['askQty']),
      highPrice: double.parse(json['highPrice']),
      lowPrice: double.parse(json['lowPrice']),
    );
  }
  @override
  String toString() {
    return 'TickerData(symbol: $symbol, lastPrice: $lastPrice, bid: $bidPrice/$bidQty, ask: $askPrice/$askQty, high: $highPrice, low: $lowPrice)';
  }
}
