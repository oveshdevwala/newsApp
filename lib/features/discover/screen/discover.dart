import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/discover/model/dicover_model.dart';
import 'package:news_app/features/discover/bloc/discover_bloc.dart';
import '../widgets/category_list_view.dart';
import '../widgets/search_feature.dart';
import '../widgets/select_category.dart';

class DicoverScreen extends StatefulWidget {
  const DicoverScreen({super.key});

  @override
  State<DicoverScreen> createState() => _DicoverScreenState();
}

class _DicoverScreenState extends State<DicoverScreen>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<DiscoverBloc>()
        .add(DicoverMainEvent(categoryApi: listOfDicoverModel[0].url));
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          SearchFeature(),
          SelectCategory(),
          CategoryListView(),
        ],
      ))),
    );
  }
}
