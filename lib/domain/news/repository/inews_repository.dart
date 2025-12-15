import 'package:mini_cash/domain/news/data/repository/request/news_request.dart';
import 'package:mini_cash/domain/news/model/news_model.dart';

abstract class INewsRepository {           
  Future<List<NewsModel>> getNews(NewsRequest data);
}