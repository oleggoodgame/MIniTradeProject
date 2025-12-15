import 'package:mini_cash/domain/news/model/news_model.dart';

class NewsState {
  final bool isLoading;
  final List<NewsModel> news;
  final String? error;

  const NewsState({
    this.isLoading = false,
    this.news = const [],
    this.error,
  });

  NewsState copyWith({
    bool? isLoading,
    List<NewsModel>? news,
    String? error,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      news: news ?? this.news,
      error: error,
    );
  }
}
