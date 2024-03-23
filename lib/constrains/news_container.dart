// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/data_source/remote/newsmodel.dart';
import 'package:news_app/features/screen/news_view/news_view.dart';

class NewsListViewLoadedState extends StatelessWidget {
  NewsListViewLoadedState({super.key, required this.newsData});
  NewsDataModel newsData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: newsData.articles.length,
      itemBuilder: (context, index) {
        ArticleModel apiPath = newsData.articles[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsView(apiPath: apiPath, index: index)));
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
              child: newsContainer(apiPath, index),
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
                apiPath.source!.id != null
                    ? Text(
                        apiPath.source!.id!,
                        style: TextStyle(color: UiColors.iconGrey),
                      )
                    : const Text(''),
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
                          "${apiPath.author!.substring(0, min(14, apiPath.author!.length)).split('@')[0]}   ${apiPath.publishedAt!.substring(0, 10)}",
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
  NewsListViewErrorState({super.key,required this.data});
  var data;
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
