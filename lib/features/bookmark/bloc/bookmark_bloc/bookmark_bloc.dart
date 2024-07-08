import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/bookmark/repository/db_helper.dart';
import 'package:news_app/features/bookmark/model/db_model.dart';
part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  DataBaseHelper dbHelper;
  BookmarkBloc({required this.dbHelper}) : super(BookmarkInitial()) {
    on<BookmarkAddEvent>(bookmarkAddEvent);
    on<BookmarkFetchEvent>(bookmarkFetchEvent);
    on<BookmarkDeleteEvent>(bookmarkDeleteEvent);
  }

  FutureOr<void> bookmarkAddEvent(
      BookmarkAddEvent event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoadingState());
        dbHelper.addBookmark(event.data);
      
    emit(BookmarkLoadedState(
        bookMarkArticleModel: await dbHelper.getBookmarks()));
  }

  FutureOr<void> bookmarkFetchEvent(
      BookmarkFetchEvent event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoadedState(
        bookMarkArticleModel: await dbHelper.getBookmarks()));
  }

  FutureOr<void> bookmarkDeleteEvent(
      BookmarkDeleteEvent event, Emitter<BookmarkState> emit) async {
    dbHelper.deleteBookmark(event.url);
    emit(BookmarkLoadedState(
        bookMarkArticleModel: await dbHelper.getBookmarks()));
  }


}
