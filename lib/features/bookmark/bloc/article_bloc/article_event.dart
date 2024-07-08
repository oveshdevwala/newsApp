// ignore_for_file: must_be_immutable

part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}
class BookmarkGetArticleByUrl extends ArticleEvent {
  String url;
  BookmarkGetArticleByUrl({
    required this.url,
  });
  
}
