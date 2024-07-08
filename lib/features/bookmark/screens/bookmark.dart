// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';
import 'package:news_app/features/bookmark/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news_app/features/home_feed/screen/news_view.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookmarkBloc>().add(BookmarkFetchEvent());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: UiColors.white,
          foregroundColor: UiColors.black,
          elevation: 0,
          surfaceTintColor: UiColors.white,
          title: const Center(
              child: Text(
            "Bookmarks",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is BookmarkErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            }
            if (state is BookmarkLoadedState) {
              if (state.bookMarkArticleModel.isEmpty) {
                return const Center(
                  child: Text(
                    'No Bookmark Found',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                );
              }

              return bookmarkListViewBuilder(state);
            }
            return const SizedBox();
          },
        ));
  }

  ListView bookmarkListViewBuilder(BookmarkLoadedState state) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.bookMarkArticleModel.length,
      itemBuilder: (context, index) {
        var dbModel = state.bookMarkArticleModel[index];
        var souceModel =
            SourceModel(id: dbModel.sourceId, name: dbModel.sourceName);
        var articleApiModel = ArticleModel(
            source: souceModel,
            author: dbModel.author,
            bookmark: dbModel.bookmark == 0 ? true : false,
            content: dbModel.content,
            description: dbModel.description,
            publishedAt: dbModel.publishedAt,
            title: dbModel.title,
            url: dbModel.redirectUrl,
            urlToImage: dbModel.urlToImage);

        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsView(apiPath: articleApiModel)));
            },
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: UiColors.grey200,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(18)),
              // title
              child: newsContainer(articleApiModel, index),
            ),
          ),
        );
      },
    );
  }
}

Row newsContainer(ArticleModel apiPath, int index) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 2,
          child: apiPath.urlToImage != null
              ? Hero(
                  tag: '$index',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(apiPath.urlToImage!))),
                  ),
                )
              : Center(
                  child: Text(
                    "No Image",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: UiColors.iconGrey),
                  ),
                )),
      // news Title,date,name and author
      Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                apiPath.source!.name != null
                    ? Text(
                        apiPath.source!.name!,
                        style: TextStyle(color: UiColors.iconGrey),
                      )
                    : const SizedBox(),
                Text(
                  apiPath.title!,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                apiPath.author != null && apiPath.publishedAt != null
                    ? FittedBox(
                        child: Text(
                          "${apiPath.author!.substring(0, min(14, apiPath.author!.length)).split('@')[0]} ${apiPath.publishedAt!.substring(0, 10)}",
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UiColors.iconGrey,
                              fontSize: 10),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    ],
  );
}

class NewsListViewErrorState extends StatelessWidget {
  NewsListViewErrorState({super.key, this.data = ''});
  String data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 160, minHeight: 150),
          child: Container(
            height: 135,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(data),
            ),
          ),
        );
      },
    );
  }
}

class NewsListViewLoadingState extends StatelessWidget {
  const NewsListViewLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 160, minHeight: 150),
          child: Container(
            height: 135,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15)),
          ),
        );
      },
    );
  }
}
