import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/style/style.dart';
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ChartIndicator(color: Colors.blue, text: 'Buy'),
                  SizedBox(width: kSmall),
                  ChartIndicator(color: Colors.red, text: 'Sell'),
                ],
              ),
              Expanded(
                child: TradeSummaryTable(
                  buy: buy,
                  sell: sell,
                  total: buy - sell,
                ),
              ),
              SizedBox(height: kLarge),
              Text(
                "All text that you see only working on 24 hour data receive",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: kLarge),
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
        const SizedBox(width: kSmall),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
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
        borderRadius: BorderRadius.circular(12),
      ),
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
      children: [
        _row('Type', 'Value', isHeader: true),
        _row('Buy (coin amount)', buy.toStringAsFixed(2)),
        _row('Sell (coin amount)', sell.toStringAsFixed(2)),
        _row('Total (coin amount)', total.toStringAsFixed(2)),
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
          padding: const EdgeInsets.all(pMedium),
          child: Text(left, style: style),
        ),
        Padding(
          padding: const EdgeInsets.all(pMedium),
          child: Text(right, style: style),
        ),
      ],
    );
  }
}
