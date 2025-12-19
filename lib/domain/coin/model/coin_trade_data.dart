class CoinTradeData {
  final double volume; // загальний обсяг базового активу
  final double takerBuyBase; // обсяг купівлі базового активу
  final double takerBuyQuote; // обсяг купівлі в котируваній валюті (USDT, BNB тощо)

  CoinTradeData({
    required this.volume,
    required this.takerBuyBase,
    required this.takerBuyQuote,
  });

  factory CoinTradeData.fromKline(List<dynamic> kline) {
    return CoinTradeData(
      volume: double.parse(kline[5].toString()),
      takerBuyBase: double.parse(kline[9].toString()),
      takerBuyQuote: double.parse(kline[10].toString()),
    );
  }

  double get sell => volume - takerBuyBase; // обсяг продажу
}
// [
//   [1766016000000, "86243.23000000",
//     "89477.61000000",
//     "85863.93000000",
//     "88084.59000000",
//     "13003.76987000", // volume
//     1766102399999, "1141018327.34791140",
//     3878189, "6212.58295000",//// Taker buy base asset volume
//     "545110217.65893420", // Taker buy quote asset volume
//     "0"
//   ]
// ]