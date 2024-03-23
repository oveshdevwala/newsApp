// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'top_headline_bloc.dart';

@immutable
sealed class TopHeadlineState {}

final class TopHeadlineInitial extends TopHeadlineState {}

class TopHeadlineLoadingState extends TopHeadlineState {}

class TopHeadlineLoadedState extends TopHeadlineState {
  NewsDataModel newsDataModel;
  TopHeadlineLoadedState({
    required this.newsDataModel,
  });
}

class TopHeadlineErrorState extends TopHeadlineState {
  String errorMsg;
  TopHeadlineErrorState({
    required this.errorMsg,
  });
}
