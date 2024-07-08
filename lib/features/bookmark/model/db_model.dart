import 'package:news_app/features/bookmark/repository/db_helper.dart';

class BookmarkDbModel {
  String? sourceId;
  String? sourceName;
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  String? title;
  int? bookmark;
  String? redirectUrl;
  String? urlToImage;
  int? id;

  BookmarkDbModel({
    required this.sourceId,
    required this.sourceName,
    required this.author,
    required this.bookmark,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.id,
    required this.redirectUrl,
    required this.urlToImage,
  });

  Map<String, dynamic> toMap() {
    return {
      DataBaseHelper.colTitle: title,
      DataBaseHelper.colAuthor: author,
      DataBaseHelper.colDicription: description,
      DataBaseHelper.colContent: content,
      DataBaseHelper.colUrlToImage: urlToImage,
      DataBaseHelper.colPublishedAt: publishedAt,
      DataBaseHelper.colRedirecturl: redirectUrl,
      DataBaseHelper.colSourceID: sourceId,
      DataBaseHelper.colSourceName: sourceName,
    };
  }

  factory BookmarkDbModel.fromMap(Map<String, dynamic> map) {
    return BookmarkDbModel(
      bookmark: map[DataBaseHelper.colBookmark],
        sourceId: map[DataBaseHelper.colSourceID],
        sourceName: map[DataBaseHelper.colSourceName],
        author: map[DataBaseHelper.colAuthor],
        content: map[DataBaseHelper.colContent],
        description: map[DataBaseHelper.colDicription],
        publishedAt: map[DataBaseHelper.colPublishedAt],
        title: map[DataBaseHelper.colTitle],
        redirectUrl: map[DataBaseHelper.colRedirecturl],
        id: map[DataBaseHelper.colId],
        urlToImage: map[DataBaseHelper.colUrlToImage]);
  }
}
