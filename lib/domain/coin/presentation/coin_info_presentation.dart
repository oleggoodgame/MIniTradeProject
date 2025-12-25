import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/domain/coin/presentation/controller/coin_info_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
      padding: const EdgeInsets.all(pMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (coin.logo.isNotEmpty)
            Center(child: Image.network(coin.logo, width: 100, height: 100)),
          const SizedBox(height: kSmall),
          Text(
            "Name: ${coin.name}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: kSmall),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Website:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    coin.website.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              final uri = Uri.tryParse(coin.website);
                              if (uri != null) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            child: Text(
                              "Website",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: Colors.blue),
                            ),
                          )
                        : Text(
                            "N/A",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                    Text(
                      "Launched: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (coin.dateLaunched != null)
                      Text(
                        coin.dateLaunched!.toLocal().toString().replaceRange(11, null, ""),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Max Supply: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      coin.maxSupply != null ? "${coin.maxSupply}" : "N/A",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Market Cap: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      coin.marketCap != null ? "${coin.marketCap}" : "N/A",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Market Cap Dominance: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      coin.marketCapDominance != null
                          ? "${coin.marketCapDominance}%"
                          : "N/A",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: kSmall),
          if (coin.description.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: kXSmall),
                Text(coin.description),
              ],
            ),
        ],
      ),
    );
  }
}
