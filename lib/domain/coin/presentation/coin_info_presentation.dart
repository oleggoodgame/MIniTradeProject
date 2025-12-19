import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/presentation/controller/coin_info_controller.dart';
class CoinInfoPresentation extends ConsumerStatefulWidget {
  final String symbol;

  const CoinInfoPresentation({super.key, required this.symbol});

  @override
  ConsumerState<CoinInfoPresentation> createState() =>
      _CoinInfoPresentationState();
}

class _CoinInfoPresentationState extends ConsumerState<CoinInfoPresentation> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinInfoControllerProvider.notifier).loadCoinInfo(widget.symbol);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(coinInfoControllerProvider.notifier).loadCoinInfo(widget.symbol);

    final state = ref.watch(coinInfoControllerProvider);

    // ref.listen<CoinInfoState>(coinInfoControllerProvider, (previous, next) {
    //   print(next.isLoading);// це не викликається
    //   print(next.coinInfo);// це не викликається
    //   print(next.error);// це не викликається

    //   if (!next.isLoading && next.coinInfo == null && next.error == null) {
    //     ref.read(coinInfoControllerProvider.notifier).loadCoinInfo(symbol);
    //     print("ABOBA");
    //   }
    // });

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text("Error: ${state.error}"));
    }

    final coin = state.coinInfo;
    print(coin);
    if (coin == null) {
      return const Text("There is no information");
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (coin.logo.isNotEmpty)
            Center(child: Image.network(coin.logo, width: 100, height: 100)),
          const SizedBox(height: 8),
          Text(
            "Name: ${coin.name}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (coin.website.isNotEmpty)
                      Text("Website: ${coin.website}"),
                    if (coin.dateLaunched != null)
                      Text(
                        "Launched: ${coin.dateLaunched!.toLocal().toIso8601String()}",
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (coin.maxSupply != null)
                      Text("Max Supply: ${coin.maxSupply}"),
                    if (coin.marketCap != null)
                      Text("Market Cap: ${coin.marketCap}"),
                    if (coin.marketCapDominance != null)
                      Text("Market Cap Dominance: ${coin.marketCapDominance}%"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (coin.description.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(coin.description),
              ],
            ),
        ],
      ),
    );
  }
}
