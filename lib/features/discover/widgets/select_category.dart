import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constrains/const/urls.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/features/discover/bloc/discover_bloc.dart';
import 'package:news_app/features/discover/model/dicover_model.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
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
                          color: discoverPath.selected
                              ? UiColors.white
                              : UiColors.black38)),
                  backgroundColor: UiColors.grey200,
                  selectedColor: UiColors.btBlue,
                  selected: discoverPath.selected,
                  avatarBorder: const CircleBorder(),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onSelected: (value) {
                    if (value) {
                      for (int i = 0; i < listOfDicoverModel.length; i++) {
                        discoverPath.selected = true;
                        listOfDicoverModel[i].selected = false;
                      }
                      Urls.recommendationNews = discoverPath.url;
                      context
                          .read<DiscoverBloc>()
                          .add(DicoverMainEvent(categoryApi: discoverPath.url));
                    } else {
                      discoverPath.selected = false;
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
}
