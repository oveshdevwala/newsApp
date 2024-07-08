
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'author': author,
      'bookmark': bookmark,
      'content': content,
      'description': description,
      'publishedAt': publishedAt,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      source: map['source'] != null ? SourceModel.fromJson(map['source'] as Map<String,dynamic>) : null,
      author: map['author'] != null ? map['author'] as String : null,
      bookmark: map['bookmark'] != null ? map['bookmark'] as bool : null,
      content: map['content'] != null ? map['content'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      publishedAt: map['publishedAt'] != null ? map['publishedAt'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
    );
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

  NewsDataModel copyWith({
    String? status,
    int? totalResults,
    List<ArticleModel>? articles,
  }) {
    return NewsDataModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }
}
