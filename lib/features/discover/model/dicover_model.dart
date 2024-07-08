// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:news_app/constrains/const/urls.dart';

class DicoverModel {
  String name;
  Color textColor;
  Color bgColor;
  String url;
  bool selected;
  DicoverModel({
    required this.selected,
    required this.name,
    required this.textColor,
    required this.bgColor,
    required this.url,
  });
}

List<DicoverModel> listOfDicoverModel = [
  DicoverModel(
      selected: true,
      name: 'All',
      textColor: UiColors.black38,
      bgColor: UiColors.grey500,
      url: Urls.allNews),
  DicoverModel(
      selected: false,
      name: 'Business',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.buisnessNews),
  DicoverModel(
      selected: false,
      name: 'Technology',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.technologyNews),
  DicoverModel(
      selected: false,
      name: 'Entertainment',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.entertainmentNews),
  DicoverModel(
      selected: false,
      name: 'Sport',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.sportNews),
  DicoverModel(
      selected: false,
      name: 'Science',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.scienceNews),
];
