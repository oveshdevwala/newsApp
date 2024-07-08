// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/common/model/newsmodel.dart';
import 'package:news_app/constrains/theme/widgets.dart';
import 'package:news_app/features/bookmark/bloc/article_bloc/article_bloc.dart';
import 'package:news_app/features/bookmark/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news_app/features/bookmark/model/db_model.dart';

class MyBookmarkButton extends StatefulWidget {
  MyBookmarkButton({super.key, required this.apiPath});

  ArticleModel apiPath;
  @override
  State<MyBookmarkButton> createState() => _MyBookmarkButtonState();
}

class _MyBookmarkButtonState extends State<MyBookmarkButton> {
  @override
  void initState() {
    super.initState();
    getArticle();
  }

  getArticle() async {
    setState(() {
      context
          .read<ArticleBloc>()
          .add(BookmarkGetArticleByUrl(url: widget.apiPath.urlToImage!));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.apiPath.urlToImage == null) {
      return const CircularProgressIndicator();
    }
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is BookmarkArticleNotFoundState) {
          return MyBlurIconButton(
              icon: CupertinoIcons.bookmark,
              onTap: () {
                context.read<BookmarkBloc>().add(BookmarkAddEvent(
                    data: BookmarkDbModel(
                        bookmark: widget.apiPath.bookmark == true ? 1 : 0,
                        sourceId: widget.apiPath.source!.id.toString(),
                        sourceName: widget.apiPath.source!.name.toString(),
                        author: widget.apiPath.author.toString(),
                        content: widget.apiPath.content.toString(),
                        description: widget.apiPath.description.toString(),
                        publishedAt: widget.apiPath.publishedAt.toString(),
                        title: widget.apiPath.title.toString(),
                        id: 0,
                        redirectUrl: widget.apiPath.url.toString(),
                        urlToImage: widget.apiPath.urlToImage.toString())));
                context.read<ArticleBloc>().add(
                    BookmarkGetArticleByUrl(url: widget.apiPath.urlToImage!));
              });
        } else if (state is BookmarkArticleLoadedState) {
          return MyBlurIconButton(
              icon: CupertinoIcons.bookmark_fill,
              onTap: () {
                context
                    .read<BookmarkBloc>()
                    .add(BookmarkDeleteEvent(url: widget.apiPath.urlToImage!));
                context.read<ArticleBloc>().add(
                    BookmarkGetArticleByUrl(url: widget.apiPath.urlToImage!));
              });
        } 
        return const SizedBox();
      },
    );
  }
}