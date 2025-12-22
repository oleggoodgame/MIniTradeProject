import 'package:flutter/material.dart';
import 'package:mini_cash/domain/news/presentation/news_presentation.dart';

class NewsScreen extends StatelessWidget {
  final int limit;

  const NewsScreen({super.key, required this.limit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: NewsPresentation(
        limit: limit,
      ),
    );
  }
}