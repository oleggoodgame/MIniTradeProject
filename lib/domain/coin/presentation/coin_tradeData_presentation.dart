import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/model/coin_trade_data.dart';
import 'package:mini_cash/domain/coin/presentation/f_chart/chart_indicator.dart';
import 'package:mini_cash/domain/coin/repository/coin_trade_data.dart';

class CoinTradedataPresentation extends ConsumerStatefulWidget {
  final String symbol;

  const CoinTradedataPresentation({super.key, required this.symbol});

  @override
  ConsumerState<CoinTradedataPresentation> createState() =>
      _CoinTradePieChartState();
}

class _CoinTradePieChartState extends ConsumerState<CoinTradedataPresentation> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final future = ref
        .watch(coinRepositoryDataProvider)
        .fetchTradeDataCoin(widget.symbol);

    return FutureBuilder<CoinTradeData>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final data = snapshot.data!;
        final buy = data.takerBuyBase;
        final sell = data.volume - data.takerBuyBase;

        return AspectRatio(
          aspectRatio: 1.3,
          child: Column(
            children: [
              Expanded(
                child: TradePieChart(
                  buy: buy,
                  sell: sell,
                  touchedIndex: touchedIndex,
                  onTouch: (i) => setState(() => touchedIndex = i),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ChartIndicator(color: Colors.blue, text: 'Buy'),
                  SizedBox(width: 6),
                  ChartIndicator(color: Colors.red, text: 'Sell'),
                ],
              ),
              Expanded(child: TradeSummaryTable(buy: buy, sell: sell, total: buy-sell,)),
              SizedBox(height: 20,),
              const Text("All text that you see only working on 24 hour data receive"),
            ],
          ),
        );
      },
    );
  }
}

class ChartIndicator extends StatelessWidget {
  final Color color;
  final String text;

  const ChartIndicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

class TradeSummaryTable extends StatelessWidget {
  final double buy;
  final double sell;
  final double total;

  const TradeSummaryTable({
    super.key,
    required this.buy,
    required this.sell,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
      children: [
        _row('Тип', 'Значення', isHeader: true),
        _row('Купівля', buy.toStringAsFixed(2)),
        _row('Продаж', sell.toStringAsFixed(2)),
        _row('Надходження', total.toStringAsFixed(2)),
      ],
    );
  }

  TableRow _row(String left, String right, {bool isHeader = false}) {
    final style = TextStyle(
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    );

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(left, style: style),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(right, style: style),
        ),
      ],
    );
  }
}
