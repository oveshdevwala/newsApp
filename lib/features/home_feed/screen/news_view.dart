// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/constrains/theme/widgets.dart';
import 'package:news_app/features/bookmark/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';

import '../widgets/my_bookmark_button.dart';

class NewsView extends StatefulWidget {
  NewsView({super.key, required this.apiPath});
  ArticleModel apiPath;
 

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    context.read<BookmarkBloc>().add(BookmarkFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
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
            MyBookmarkButton(apiPath: widget.apiPath),
            const SizedBox(width: 10),
            MyBlurIconButton(icon: Icons.more_horiz_outlined, onTap: () {}),
            const SizedBox(width: 20)
          ],
          expandedHeight: 350,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
              background: widget.apiPath.urlToImage != null
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.apiPath.urlToImage!))),
                    )
                  : Container(
                      color: UiColors.grey200,
                      child: Center(
                        child: Text(
                          "No Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UiColors.iconGrey),
                        ),
                      ),
                    ),
              titlePadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
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
                      // sourceContainer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.apiPath.source!.id != null
                              ? Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                      color: UiColors.btBlue,
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: FittedBox(
                                        child: Text(
                                          widget.apiPath.source!.id!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 6,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )))
                              : const Text(''),
                          const FlexibleSpaceBar()
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.apiPath.title!,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 11, overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 5),
                      // authorAndTimeContainer
                      (widget.apiPath.author != null &&
                              widget.apiPath.publishedAt != null
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: FittedBox(
                                child: Text(
                                  "${widget.apiPath.author!.substring(0, min(14, widget.apiPath.author!.length)).split('@')[0]}     ${widget.apiPath.publishedAt!.substring(0, 10)}",
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 7,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            )
                          : const Text('')),
                    ],
                  ),
                ),
              )),
        ),
        myNewsViewContainer()
      ],
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
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    widget.apiPath.source!.name!,
                    style: TextStyle(color: UiColors.black, fontSize: 22),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.verified_rounded,
                    color: UiColors.btBlue,
                    size: 22,
                  )
                ],
              ),
              const SizedBox(height: 10),
              (widget.apiPath.content != null &&
                      widget.apiPath.description != null
                  ? Text(
                      "${widget.apiPath.description!}${widget.apiPath.content!}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: UiColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "${widget.apiPath.title}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: UiColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
