// ignore_for_file: public_member_api_docs, sort_constructors_first
class SourceModel {
  String? id;
  String? name;
  SourceModel({
    required this.id,
    required this.name,
  });
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }
}
class ArticleModel {
  SourceModel? source; //  id // name
  String? author; //
  bool? bookmark; //
  String? content; //
  String? description; //
  String? publishedAt; //
  String? title; //
  String? url;
  String? urlToImage; //
  ArticleModel({
    required this.source,
    required this.author,
    required this.bookmark,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        bookmark: false,
        source: SourceModel.fromJson(json['source']),
        author: json['author'],
        content: json['content'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}

class NewsDataModel {
  String status;
  int totalResults;
  List<ArticleModel> articles;
  NewsDataModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsDataModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> listOfArticle = [];
    for (Map<String, dynamic> eachMap in json['articles']) {
      listOfArticle.add(ArticleModel.fromJson(eachMap));
    }
    return NewsDataModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: listOfArticle);
  }
}
