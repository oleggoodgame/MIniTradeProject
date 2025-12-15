import 'package:flutter_riverpod/legacy.dart';
import 'package:mini_cash/domain/news/data/repository/request/news_request.dart';
import 'package:mini_cash/domain/news/presentation/state/news_state.dart';
import 'package:mini_cash/domain/news/repository/inews_repository.dart';
import 'package:mini_cash/domain/news/repository/news_repository.dart';

final newsControllerProvider =
    StateNotifierProvider.autoDispose<NewsController, NewsState>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsController(repository)..loadNews();
});

class NewsController extends StateNotifier<NewsState> {
  final INewsRepository _repository;

  NewsController(this._repository) : super(const NewsState());

  Future<void> loadNews() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final news = await _repository.getNews(
        NewsRequest(
          limit: 10,
          sort: 'published_utc',
          order: 'desc',
        ),
      );

      state = state.copyWith(
        isLoading: false,
        news: news,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
