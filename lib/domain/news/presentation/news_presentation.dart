import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/domain/news/model/news_model.dart';
import 'package:mini_cash/domain/news/presentation/controller/news_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPresentation extends ConsumerWidget {
  final int limit;

  const NewsPresentation({super.key, required this.limit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsControllerProvider(limit));

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
    return InkWell(
      borderRadius: BorderRadius.circular(kMedium),
      onTap: () async {
        final uri = Uri.tryParse(news.homepageUrl);

        if (uri == null) return;

        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: pMedium),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMedium),
        ),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(pMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(news.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: kSmall),
              Text(
                news.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: kSmall),
              Row(
                children: [
                  _PublisherLogo(logoUrl: news.publisherLogoUrl),

                  const SizedBox(width: kSmall),
                  Text(
                    news.publisher,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PublisherLogo extends StatelessWidget {
  final String logoUrl;

  const _PublisherLogo({required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    try {
      if (logoUrl.isEmpty) return const SizedBox();

      if (!logoUrl.toLowerCase().endsWith('.svg')) {
        return Image.network(
          logoUrl,
          height: 24,
          errorBuilder: (_, __, ___) => const SizedBox(),
        );
      }

      return SvgPicture.network(
        logoUrl,
        height: 24,
        placeholderBuilder: (_) => const SizedBox(height: 24, width: 24),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
