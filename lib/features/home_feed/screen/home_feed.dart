import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/constrains/const/urls.dart';
import 'package:news_app/features/discover/bloc/discover_bloc.dart';
import '../widgets/recomandation_news.dart';
import '../widgets/top_headline_carousel.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<DiscoverBloc>()
        .add(DicoverMainEvent(categoryApi: Urls.recommendationNews));
    return SafeArea(
      child: Scaffold(
        backgroundColor: UiColors.white,
        drawer: Drawer(
          width: 300,
          backgroundColor: UiColors.bgBlue,
        ),
        // appBar: myHomeAppBar(context, _scaffoldKey),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopHeadlineCarousel(),
              SizedBox(height: 10),
              Divider(
                color: UiColors.grey200,
                height: 10,
              ),
              const RecomandationNews(),
            ],
          ),
        ),
      ),
    );
  }
}
