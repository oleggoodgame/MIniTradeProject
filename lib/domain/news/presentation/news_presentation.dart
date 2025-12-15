import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_cash/domain/news/model/news_model.dart';
import 'package:mini_cash/domain/news/presentation/controller/news_controller.dart';

class NewsPresentation extends ConsumerWidget {
  const NewsPresentation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsControllerProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Text(state.error!, style: const TextStyle(color: Colors.red)),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.news.length,
      itemBuilder: (context, index) {
        final item = state.news[index];
        return _NewsCard(item);
      },
    );
  }
}

class _NewsCard extends StatelessWidget {
  final NewsModel news;

  const _NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              news.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (news.publisherLogoUrl.isNotEmpty)
                  SvgPicture.network(news.publisherLogoUrl, height: 24),
                const SizedBox(width: 8),
                Text(
                  news.publisher,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
