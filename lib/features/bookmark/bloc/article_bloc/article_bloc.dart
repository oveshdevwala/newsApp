import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/bookmark/model/db_model.dart';
import 'package:news_app/features/bookmark/repository/db_helper.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final DataBaseHelper dbHelper;
  ArticleBloc(this.dbHelper) : super(ArticleInitial()) {
    on<BookmarkGetArticleByUrl>(bookmarkGetArticleByUrl);
  }
  FutureOr<void> bookmarkGetArticleByUrl(
      BookmarkGetArticleByUrl event, Emitter<ArticleState> emit) async {
    emit(BookmarkArticleLoadingState());
    var booked = await dbHelper.getBookmarks();
    if (booked.isNotEmpty) {
      for (var each in booked) {
        if (each.urlToImage == event.url) {
          emit(BookmarkArticleLoadedState(articleModel: each));
         
        } else {
          emit(BookmarkArticleNotFoundState());
        }
      }
    } else {
      emit(BookmarkArticleNotFoundState());
    }
  }
}
