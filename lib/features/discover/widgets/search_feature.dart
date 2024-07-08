import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/const/urls.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/features/discover/bloc/discover_bloc.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                suffixIcon: IconButton(
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
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
