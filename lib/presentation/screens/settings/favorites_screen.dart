import 'package:flutter/material.dart';
import 'package:mini_cash/domain/favorites/presentation/favorite_presentation.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: FavoritePresentation(),
      ),
    );
  }
}