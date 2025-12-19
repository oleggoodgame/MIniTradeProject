import 'package:mini_cash/entity/ticker_entity.dart';

abstract class ItickerRepository {
  Future<TickerEntity> fetchTicker(String symbol);
  void tickerStream(String symbol);
}
