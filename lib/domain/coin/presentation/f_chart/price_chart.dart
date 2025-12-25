import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/provider/f_chart_provider.dart';

class PriceChart extends ConsumerWidget {
  const PriceChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spots = ref.watch(counterProvider);
    final minY = spots.isNotEmpty
        ? spots.map((e) => e.y).reduce(min) * 0.99995
        : 0.0;
    final maxY = spots.isNotEmpty
        ? spots.map((e) => e.y).reduce(max) * 1.00005
        : 1.0;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        height: 350,
        child: LineChart(
          LineChartData(
            minY: minY,
            maxY: maxY,
            gridData: FlGridData(show: false),
            clipData: FlClipData.all(),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 50),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false, reservedSize: 60),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false, reservedSize: 60),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                color: Colors.amber,
                spots: spots,
                isCurved: true,
                dotData: FlDotData(show: false),
                barWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
