// ignore_for_file: must_be_immutable

part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}
class BookmarkArticleLoadedState extends ArticleState {
  BookmarkDbModel articleModel;
  BookmarkArticleLoadedState({
    required this.articleModel,
  });
}
class BookmarkArticleNotFoundState extends ArticleState {
}
class BookmarkArticleLoadingState extends ArticleState {
}
