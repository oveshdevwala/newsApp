// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'discover_bloc.dart';

@immutable
sealed class DiscoverEvent {}

class DicoverMainEvent extends DiscoverEvent {
  String categoryApi;
  DicoverMainEvent({
    required this.categoryApi,
  });
}
