import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/widgets/favorite_widget.dart';
import 'package:mini_cash/domain/favorites/provider/favorite_provider.dart';
import 'package:mini_cash/domain/news/presentation/news_presentation.dart';

class HomePresentation extends ConsumerStatefulWidget {
  const HomePresentation({super.key});

  @override
  ConsumerState<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends ConsumerState<HomePresentation> {


  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProvider);
    return Column(
      children: [
        const Text(
          "List of news",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Expanded(child: const NewsPresentation(limit: 10)),

        const SizedBox(height: 32),
        Row(
          children: [
            const Text(
              "Favorite Coins",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
              context.pushNamed('favorites');
            }, icon: const Icon(Icons.navigate_next_sharp))
          ],
        ),
        const SizedBox(height: 12),
        favorites.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final coin = data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: FavoriteCoinWidget(coin: coin),
                );
              },
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            );
          },
          error: (er, _) => Center(child: Text(er.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
