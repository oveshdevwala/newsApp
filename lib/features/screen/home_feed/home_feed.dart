import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/data_source/remote/urls.dart';
import 'package:news_app/features/screen/home_feed/widgets/my_appbar.dart';
import 'package:news_app/features/state_mangement/discover_bloc/bloc/discover_bloc.dart';
import 'package:news_app/features/state_mangement/top_headline/top_headline_bloc.dart';

import '../../../constrains/widgets/widgets.dart';
import 'widgets/recomandation_news.dart';
import 'widgets/top_headline_carousel.dart';

class HomeFeed extends StatelessWidget {
  HomeFeed({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<TopHeadlineBloc>().add(TopHeadlineMainEvent());
    context
        .read<DiscoverBloc>()
        .add(DicoverMainEvent(categoryApi: Urls.recommendationNews));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UiColors.white,
      drawer: Drawer(
        width: 300,
        backgroundColor: UiColors.bgBlue,
      ),
      appBar: myHomeAppBar(context, _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ViewAllBar(title: 'Breaking News', onTap: () {}),
            const TopHeadlineCarousel(),
            ViewAllBar(title: "Recommendations", onTap: () {}),
            const RecomandationNews(),
          ],
        ),
      ),
    );
  }
}
