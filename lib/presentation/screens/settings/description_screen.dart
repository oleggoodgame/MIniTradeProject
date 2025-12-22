import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("About this project"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: "📌 Project overview"),
            _SectionText(
              text:
                  "This application is a learning pet-project focused on cryptocurrency tracking, "
                  "market data visualization, and real-time updates. "
                  "The main goal of the project is not the final product itself, "
                  "but deep learning and practical experience with modern Flutter technologies.",
            ),

            const SizedBox(height: 24),

            _SectionTitle(title: "🔗 APIs & Data sources"),
            _BulletText(
              text:
                  "Binance API — used for receiving real-time cryptocurrency prices, "
                  "market data, and live updates via WebSocket.",
            ),
            _BulletText(
              text:
                  "Massive.com — used as a source of economic and financial news "
                  "to better understand market context.",
            ),

            const SizedBox(height: 24),

            _SectionTitle(title: "🎓 What I wanted to learn"),
            _BulletText(
              text:
                  "WebSocket — working with real-time data streams and live updates.",
            ),
            _BulletText(
              text:
                  "Clean Architecture — separating the app into data, domain, and presentation layers.",
            ),
            _BulletText(
              text:
                  "Database practice — improving skills with local and remote data storage.",
            ),
            _BulletText(
              text:
                  "Charts & analytics — visualizing market data using FL Chart.",
            ),
            _BulletText(
              text:
                  "Routing — deeper understanding of navigation and complex routing scenarios.",
            ),
            _BulletText(
              text:
                  "Riverpod — advanced state management, providers, and app-wide state handling.",
            ),

            const SizedBox(height: 24),

            _SectionTitle(title: "🚀 Final goal"),
            _SectionText(
              text:
                  "The final goal of this project is to become more confident in building "
                  "scalable Flutter applications, understanding real-world app architecture, "
                  "and preparing a solid foundation for future commercial projects.",
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _SectionText extends StatelessWidget {
  final String text;

  const _SectionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: Colors.grey.shade800,
            ),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;

  const _BulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  "),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
