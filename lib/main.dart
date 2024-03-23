import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/data_source/bloc/bookmark_bloc.dart';
import 'package:news_app/data_source/local/db_helper.dart';
import 'package:news_app/data_source/remote/apihelper.dart';
import 'package:news_app/features/screen/home_screen/home_screen.dart';
import 'package:news_app/features/state_mangement/Categories_bloc/categories_bloc.dart';
import 'package:news_app/features/state_mangement/discover_bloc/bloc/discover_bloc.dart';
import 'package:news_app/features/state_mangement/top_headline/top_headline_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CategoriesBloc(apiHelper: ApiHelper())),
        BlocProvider(
            create: (context) => TopHeadlineBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context) => DiscoverBloc(apiHelper: ApiHelper())),
        BlocProvider(
            create: (context) =>
                BookmarkBloc(dbHelper: DataBaseHelper.instance)),
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
