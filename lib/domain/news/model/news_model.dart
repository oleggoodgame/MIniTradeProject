class NewsModel {
  final String title;
  final String publisher;
  final String homepageUrl;
  final String articleUrl;
  final String publisherLogoUrl;
  final String description;

  NewsModel({
    required this.title,
    required this.publisher,
    required this.homepageUrl,
    required this.publisherLogoUrl,
    required this.description,
    required this.articleUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      publisher: json['publisher']?['name'] ?? '',
      homepageUrl: json['publisher']?['homepage_url'] ?? '',
      publisherLogoUrl: json['publisher']?['logo_url'] ?? '',
      description: json['description'] ?? '',
      articleUrl: json['article_url'] ?? '',
    );
  }
}
