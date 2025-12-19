import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TradePieChart extends StatelessWidget {
  final double buy;
  final double sell;
  final int touchedIndex;
  final ValueChanged<int> onTouch;

  const TradePieChart({
    super.key,
    required this.buy,
    required this.sell,
    required this.touchedIndex,
    required this.onTouch,
  });

  @override
  Widget build(BuildContext context) {
    final total = buy + sell;

    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (event, response) {
            if (!event.isInterestedForInteractions ||
                response == null ||
                response.touchedSection == null) {
              onTouch(-1);
              return;
            }
            onTouch(response.touchedSection!.touchedSectionIndex);
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            color: Colors.blue,
            value: buy,
            title: '${(buy / total * 100).toStringAsFixed(1)}%',
            radius: touchedIndex == 0 ? 60 : 50,
            titleStyle: TextStyle(
              fontSize: touchedIndex == 0 ? 22 : 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: Colors.red,
            value: sell,
            title: '${(sell / total * 100).toStringAsFixed(1)}%',
            radius: touchedIndex == 1 ? 60 : 50,
            titleStyle: TextStyle(
              fontSize: touchedIndex == 1 ? 22 : 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
