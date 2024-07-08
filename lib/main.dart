import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/features/bookmark/bloc/article_bloc/article_bloc.dart';
import 'package:news_app/features/bookmark/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news_app/features/bookmark/repository/db_helper.dart';
import 'package:news_app/constrains/app/apihelper.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/features/discover/bloc/discover_bloc.dart';
import 'package:news_app/features/home_feed/bloc/top_headline_bloc/top_headline_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TopHeadlineBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context) => DiscoverBloc(apiHelper: ApiHelper())),
        BlocProvider(
            create: (context) =>
                BookmarkBloc(dbHelper: DataBaseHelper.instance)),
        BlocProvider(
            create: (context) =>
                ArticleBloc( DataBaseHelper.instance)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              surfaceTintColor: UiColors.white,
            ),
            scaffoldBackgroundColor: UiColors.white),
        home: const HomeScreen());
  }
}
