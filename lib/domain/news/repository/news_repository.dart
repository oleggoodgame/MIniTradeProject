import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/news/data/repository/request/news_request.dart';
import 'package:mini_cash/domain/news/data/sources/news_api.dart';
import 'package:mini_cash/domain/news/model/news_model.dart';
import 'package:mini_cash/domain/news/repository/inews_repository.dart';
final newsRepositoryProvider = Provider.autoDispose<INewsRepository>((ref) {
  final newsAPI = ref.watch(newsApiProvider);

  return NewsRepository(newsAPI);
});

class NewsRepository implements INewsRepository {
  final NewsApi _newsAPI;

  NewsRepository(this._newsAPI);

  @override
  Future<List<NewsModel>> getNews(NewsRequest data) async {
    return await _newsAPI.getNews(data);
  }

}
