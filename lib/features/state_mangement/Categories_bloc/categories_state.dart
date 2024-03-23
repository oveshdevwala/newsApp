// ignore_for_file: must_be_immutable

part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}


class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  NewsDataModel newsDataModel;
  CategoriesLoadedState({
    required this.newsDataModel,
  });
}

class CategoriesErrorState extends CategoriesState {
  String errorMsg;
  CategoriesErrorState({
    required this.errorMsg,
  });
  
}