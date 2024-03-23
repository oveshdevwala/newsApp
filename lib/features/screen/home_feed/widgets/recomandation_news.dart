// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/features/state_mangement/Categories_bloc/categories_bloc.dart';
import 'package:news_app/features/state_mangement/discover_bloc/bloc/discover_bloc.dart';

import '../../../../constrains/news_container.dart';

class RecomandationNews extends StatefulWidget {
  const RecomandationNews({super.key});

  @override
  State<RecomandationNews> createState() => _RecomandationNewsState();
}

class _RecomandationNewsState extends State<RecomandationNews> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is DicoverLoadingState) {
          return const NewsListViewLoadingState();
        }
        if (state is DicoverErrorState) {
          var data = state.errorMsg;
          return NewsListViewErrorState(
            data: data
          );
        }
        if (state is DicoverLoadedState) {
          var newsData = state.newsDataModel;
          return NewsListViewLoadedState(newsData: newsData);
        }
        return Container();
      },
    );
  }
}
