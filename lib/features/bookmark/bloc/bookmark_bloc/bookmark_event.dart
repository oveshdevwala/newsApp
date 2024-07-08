// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkEvent {}

class BookmarkAddEvent extends BookmarkEvent {
  BookmarkDbModel data;
  BookmarkAddEvent({
    required this.data,
  });
}


class BookmarkFetchEvent extends BookmarkEvent {}

class BookmarkDeleteEvent extends BookmarkEvent {
  String url;
  BookmarkDeleteEvent({
    required this.url,
  });
}
