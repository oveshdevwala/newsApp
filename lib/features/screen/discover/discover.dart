import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/data_source/remote/urls.dart';
import 'package:news_app/features/model/dicover_model.dart';
import 'package:news_app/features/state_mangement/discover_bloc/bloc/discover_bloc.dart';

import 'widgets/category_list_view.dart';

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
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(height: 50),
        discovertitleAndTExtField(),
        selectCategory(),
        const CategoryListView()
      ],
    )));
  }

  Widget selectCategory() {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          itemCount: listOfDicoverModel.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var discoverPath = listOfDicoverModel[index];
            return Row(
              children: [
                const SizedBox(width: 10),
                ChoiceChip(
                  focusNode: FocusNode(),
                  showCheckmark: false,
                  label: Text(discoverPath.name,
                      style: TextStyle(
                          color: discoverPath.Selected
                              ? UiColors.white
                              : UiColors.black38)),
                  backgroundColor: UiColors.grey200,
                  selectedColor: UiColors.btBlue,
                  selected: discoverPath.Selected,
                  avatarBorder: const CircleBorder(),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onSelected: (value) {
                    if (value) {
                      for (int i = 0; i < listOfDicoverModel.length; i++) {
                        discoverPath.Selected = true;
                        listOfDicoverModel[i].Selected = false;
                      }
                      Urls.recommendationNews = discoverPath.url;
                      context
                          .read<DiscoverBloc>()
                          .add(DicoverMainEvent(categoryApi: discoverPath.url));
                    } else {
                      discoverPath.Selected = false;
                    }
                    setState(() {});
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget discovertitleAndTExtField() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dicover',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          Text(
            'News From All Around The World',
            style: TextStyle(
                fontSize: 12,
                color: UiColors.grey500,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        context.read<DiscoverBloc>().add(DicoverMainEvent(
                            categoryApi:
                                "${Urls.searchNewsUrl}${searchController.text.toString()}${Urls.apiKey}"));
                      }
                    },
                    icon: Icon(CupertinoIcons.search,
                        color: UiColors.grey, size: 27)),
                hintText: 'Search',
                hintStyle: TextStyle(color: UiColors.grey500),
                fillColor: UiColors.grey200,
                suffixIcon: Icon(
                  Icons.format_align_left_outlined,
                  color: UiColors.grey500,
                ),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25))),
          )
        ],
      ),
    );
  }
}
