// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkState {}

final class BookmarkInitial extends BookmarkState {}

class BookmarkLoadingState extends BookmarkState {}

class BookmarkLoadedState extends BookmarkState {
  List<BookmarkDbModel> bookMarkArticleModel;
  BookmarkLoadedState({
    required this.bookMarkArticleModel,
  });
}

class BookmarkErrorState extends BookmarkState {
  String errorMsg;
  BookmarkErrorState({
    required this.errorMsg,
  });
  
}
