import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/domain/favorites/presentation/favorite_presentation.dart';
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(kMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: "News", icon: Icons.newspaper),
          const SizedBox(height: kSmall),

          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(kSmall),
                child: NewsPresentation(limit: limitNewsHome),
              ),
            ),
          ),

          const SizedBox(height: kExtraLarge),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SectionHeader(title: "Favorite Coins", icon: Icons.star),
              TextButton.icon(
                onPressed: () {
                  context.pushNamed('favorites');
                },
                icon: const Icon(Icons.navigate_next),
                label: const Text("All"),
              ),
            ],
          ),

          const SizedBox(height: kSmall),

          favorites.when(
            data: (data) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 220,
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FavoritePresentation(),
                ),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(kMedium),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Text(e.toString()),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: kSmall),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
