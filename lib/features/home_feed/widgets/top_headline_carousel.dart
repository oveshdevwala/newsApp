// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/constrains/theme/widgets.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';
import 'package:news_app/features/home_feed/screen/news_view.dart';
import 'package:news_app/features/home_feed/bloc/top_headline_bloc/top_headline_bloc.dart';

class TopHeadlineCarousel extends StatefulWidget {
  const TopHeadlineCarousel({super.key});

  @override
  State<TopHeadlineCarousel> createState() => _TopHeadlineCarouselState();
}

class _TopHeadlineCarouselState extends State<TopHeadlineCarousel> {
  @override
  void initState() {
    super.initState();

    context.read<TopHeadlineBloc>().add(TopHeadlineMainEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllBar(title: 'Breaking News', onTap: () {}),
        
          const SizedBox(height: 10),
        BlocBuilder<TopHeadlineBloc, TopHeadlineState>(
          builder: (context, state) {
            if (state is TopHeadlineLoadingState) {
              return MyNewsCarousel(
                builder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: UiColors.grey200,
                    ),
                    child: const Center(child: Text('')),
                  );
                },
                counts: 10,
              );
            }
            if (state is TopHeadlineErrorState) {
              return MyNewsCarousel(
                  builder: (context, index, realIndex) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: UiColors.grey200,
                      ),
                      child: const Center(child: Text('')),
                    );
                  },
                  counts: 10);
            }
            if (state is TopHeadlineLoadedState) {
              NewsDataModel newsDataModel = state.newsDataModel;

              return MyNewsCarousel(
                  builder: (context, index, realIndex) {
                    var apiPath = newsDataModel.articles[index];
                    return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return NewsView(apiPath: apiPath);
                            },
                          ));
                        },
                        child: cardContainer(apiPath));
                  },
                  counts: 10);
            }
            return Container(
              color: Colors.red,
              height: 200,
              width: 200,
            );
          },
        ),
      ],
    );
  }

  Container cardContainer(ArticleModel apipath) {
    return Container(
      width: double.infinity,
      decoration: apipath.urlToImage != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: UiColors.grey200,
              image: DecorationImage(
                  opacity: 1.6,
                  fit: BoxFit.cover,
                  image: NetworkImage(apipath.urlToImage!)))
          : BoxDecoration(
              color: UiColors.grey200,
              borderRadius: BorderRadius.circular(18),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          apipath.author != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: UiColors.btBlue,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              apipath.author!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ))),
                )
              : const Text(''),
          apipath.source!.name != null
              ? Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: UiColors.black.withOpacity(0.3),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(22))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            apipath.source!.name!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: UiColors.white,
                                fontSize: 11,
                                shadows: [
                                  Shadow(
                                    color: UiColors.black,
                                    blurRadius: 5,
                                  )
                                ]),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.verified_rounded,
                            color: UiColors.btBlue,
                            size: 17,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        apipath.title!,
                        maxLines: 3,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            shadows: [
                              Shadow(color: UiColors.black, blurRadius: 5)
                            ],
                            fontSize: 12,
                            color: UiColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
