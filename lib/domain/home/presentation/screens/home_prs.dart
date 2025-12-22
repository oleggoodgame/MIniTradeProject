import 'package:flutter/material.dart';
import 'package:mini_cash/domain/news/presentation/news_presentation.dart';

class HomePresentation extends StatefulWidget {
  const HomePresentation({super.key});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  final List<String> topWatched = [
    "Most watched #1",
    "Most watched #2",
    "Most watched #3",
  ];

  final List<String> savedNews = ["Saved #1", "Saved #2", "Saved #3"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------- NEWS ----------------
        const Text(
          "Список новин",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Expanded(child: const NewsPresentation(limit: 10)),

        const SizedBox(height: 32),

        // // ---------------- TOP WATCHED ----------------
        // const Text(
        //   "Твої найбільше переглянуті за цей тиждень",
        //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(height: 12),

        // ...topWatched.map((e) => _topItem(e)),

        // const SizedBox(height: 32),

        // ---------------- SAVED ----------------
        const Text(
          "Три збережені",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        ...savedNews.map((e) => _savedItem(e)),
      ],
    );
  }

  // ---------- Item Widgets -----------

  Widget _newsItem(String text) {
    return Card(
      child: ListTile(title: Text(text), leading: const Icon(Icons.article)),
    );
  }

  Widget _topItem(String text) {
    return Card(
      color: Colors.orange.shade50,
      child: ListTile(
        title: Text(text),
        leading: const Icon(Icons.trending_up),
      ),
    );
  }

  Widget _savedItem(String text) {
    return Card(
      color: Colors.green.shade50,
      child: ListTile(title: Text(text), leading: const Icon(Icons.bookmark)),
    );
  }
}
