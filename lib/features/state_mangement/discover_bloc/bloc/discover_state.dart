// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'discover_bloc.dart';

@immutable
sealed class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

class DicoverLoadingState extends DiscoverState {}

class DicoverErrorState extends DiscoverState {
  String errorMsg;
  DicoverErrorState({
    required this.errorMsg,
  });
}

class DicoverLoadedState extends DiscoverState {
  NewsDataModel newsDataModel;
  DicoverLoadedState({
    required this.newsDataModel,
  });
}
