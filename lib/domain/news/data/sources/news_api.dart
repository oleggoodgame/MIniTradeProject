import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/domain/news/data/repository/request/news_request.dart';
import 'package:mini_cash/domain/news/model/news_model.dart';
import 'package:mini_cash/domain/news/repository/inews_repository.dart';
final newsApiProvider= Provider.autoDispose<NewsApi>((ref) {
  return NewsApi();
});
class NewsApi implements INewsRepository {
  static const _baseUrl = 'https://api.massive.com/v2/reference/news';
  static const _apiKey = 'gtoZWirXqebB7F4uk1jFrp438AvcEvBu';

  @override
  Future<List<NewsModel>> getNews(NewsRequest data) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'limit': data.limit.toString(),
        'sort': data.sort,
        'order': data.order,
        'apiKey': _apiKey,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load news');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final results = json['results'] as List;

    return results
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}
