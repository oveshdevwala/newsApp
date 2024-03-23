// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/constrains/widgets/widgets.dart';
import 'package:news_app/data_source/bloc/bookmark_bloc.dart';
import 'package:news_app/data_source/local/db_model.dart';
import 'package:news_app/data_source/remote/newsmodel.dart';

class NewsView extends StatelessWidget {
  NewsView({super.key, required this.apiPath, required this.index});
  ArticleModel apiPath;
  int index;
  @override
  Widget build(BuildContext context) {
    context.read<BookmarkBloc>().add(BookmarkFetchEvent());
    return Scaffold(
        body: CustomScrollView(
      slivers: [myNewsViewAppBar(context, apiPath), myNewsViewContainer()],
    ));
  }

  SliverToBoxAdapter myNewsViewContainer() {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: UiColors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myAuthorAndBadgeRow(),
              const SizedBox(height: 10),
              myNewsDiscription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myNewsDiscription() {
    return apiPath.content != null && apiPath.description != null
        ? Text(
            "${apiPath.description!}${apiPath.content!}",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: UiColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            "${apiPath.title}",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: UiColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Row myAuthorAndBadgeRow() {
    return Row(
      children: [
        const SizedBox(width: 20),
        Text(
          apiPath.source!.name!,
          style: TextStyle(color: UiColors.black, fontSize: 22),
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.verified_rounded,
          color: UiColors.btBlue,
          size: 22,
        )
      ],
    );
  }

  SliverAppBar myNewsViewAppBar(BuildContext context, ArticleModel apiPath) {
    var bloc = context.read<BookmarkBloc>();
    return SliverAppBar(
      leadingWidth: 80,
      bottom: PreferredSize(
          preferredSize: const Size(100, 10),
          child: Container(
            height: 10,
          )),
      stretch: true,
      shadowColor: Colors.black,
      backgroundColor: UiColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), side: const BorderSide()),
      leading: Row(
        children: [
          const SizedBox(width: 10),
          MyBlurIconButton(
              icon: CupertinoIcons.back,
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
      actions: [
        BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoadedState) {
              return MyBlurIconButton(
                  icon: apiPath.bookmark == true
                      ? CupertinoIcons.bookmark_fill
                      : CupertinoIcons.bookmark,
                  onTap: () {
                    if (!apiPath.bookmark!) {
                      apiPath.bookmark = true;
                      bloc.add(BookmarkAddEvent(
                          data: BookmarkDbModel(
                              bookmark: apiPath.bookmark == true ? 1 : 0,
                              sourceId: apiPath.source!.id.toString(),
                              sourceName: apiPath.source!.name.toString(),
                              author: apiPath.author.toString(),
                              content: apiPath.content.toString(),
                              description: apiPath.description.toString(),
                              publishedAt: apiPath.publishedAt.toString(),
                              title: apiPath.title.toString(),
                              id: 0,
                              redirectUrl: apiPath.url.toString(),
                              urlToImage: apiPath.urlToImage.toString())));
                    } else {
                      bloc.add(BookmarkDeleteEvent(
                          id: state.bookMarkArticleModel[index].id!));
                      apiPath.bookmark = false;
                    }
                  });
            }
            return const SizedBox();
          },
        ),
        const SizedBox(width: 10),
        MyBlurIconButton(icon: Icons.more_horiz_outlined, onTap: () {}),
        const SizedBox(width: 20)
      ],
      // scrolledUnderElevation: 0,
      expandedHeight: 350,
      floating: true,
      flexibleSpace: flexableNewsImage(),
    );
  }

  FlexibleSpaceBar flexableNewsImage() {
    return FlexibleSpaceBar(
        background: newsImage(),
        titlePadding: EdgeInsets.zero,
        title: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(0), boxShadow: [
            BoxShadow(
              color: UiColors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 20,
            )
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                sourceContainer(),
                const SizedBox(height: 5),
                titleContainer(),
                const SizedBox(height: 5),
                authorAndTimeContainer(),
              ],
            ),
          ),
        ));
  }

  Widget newsImage() {
    return apiPath.urlToImage != null
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
        : Container(
            color: UiColors.grey200,
            child: Center(
              child: Text(
                "No Image",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: UiColors.iconGrey),
              ),
            ),
          );
  }

  Widget authorAndTimeContainer() {
    return apiPath.author != null && apiPath.publishedAt != null
        ? Align(
            alignment: Alignment.bottomLeft,
            child: FittedBox(
              child: Text(
                "${apiPath.author!.substring(0, min(14, apiPath.author!.length)).split('@')[0]}     ${apiPath.publishedAt!.substring(0, 10)}",
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 7, overflow: TextOverflow.ellipsis),
              ),
            ),
          )
        : const Text('');
  }

  Text titleContainer() {
    return Text(
      apiPath.title!,
      maxLines: 3,
      style: const TextStyle(fontSize: 11, overflow: TextOverflow.ellipsis),
    );
  }

  Row sourceContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        apiPath.source!.id != null
            ? Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: UiColors.btBlue,
                    borderRadius: BorderRadius.circular(22)),
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text(
                        apiPath.source!.id!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )))
            : const Text(''),
        const FlexibleSpaceBar()
      ],
    );
  }
}
// var provider = context.read<NewsViewProvider>();

              // bool checker = provider.bookmarkedList.contains(apiPath.title);
              // if (provider.bookmarkedList.isEmpty) {
              //   provider.bookmarkAdd(BookMarkArticleModel(
              //       isBookmarked: true, articleModel: apiPath));
              // } else if (provider.bookmarkedList.isNotEmpty) {
              // for (int i = 0; i < provider.bookmarkedList.length; i++) {
              // bool checker = provider.bookmarkedList.contains(
              //     BookMarkArticleModel(
              //         articleModel: apiPath, isBookmarked: true));

              // if (checker) {
              //   provider.bookmarkRemove(BookMarkArticleModel(
              //       isBookmarked: true, articleModel: apiPath));
              // } else {
              //   provider.bookmarkAdd(BookMarkArticleModel(
              //       isBookmarked: true, articleModel: apiPath));
              // }
              // // }
              // }