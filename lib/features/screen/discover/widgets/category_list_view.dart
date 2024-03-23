import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/news_container.dart';
import 'package:news_app/features/state_mangement/discover_bloc/bloc/discover_bloc.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is DicoverLoadingState) {
          return const NewsListViewLoadingState();
        }
        if (state is DicoverErrorState) {
          return NewsListViewErrorState(
            data: state.errorMsg,
          );
        }
        if (state is DicoverLoadedState) {
          var newsData = state.newsDataModel;
          return NewsListViewLoadedState(newsData: newsData);
        }
        return const SizedBox();
      },
    );
  }
}
