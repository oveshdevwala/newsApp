// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/data_source/remote/urls.dart';

class DicoverModel {
  String name;
  Color textColor;
  Color bgColor;
  String url;
  bool Selected;
  DicoverModel({
    required this.Selected,
    required this.name,
    required this.textColor,
    required this.bgColor,
    required this.url,
  });
}

List<DicoverModel> listOfDicoverModel = [
  DicoverModel(
      Selected: true,
      name: 'All',
      textColor: UiColors.black38,
      bgColor: UiColors.grey500,
      url: Urls.allNews),
  DicoverModel(
      Selected: false,
      name: 'Business',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.buisnessNews),
  DicoverModel(
      Selected: false,
      name: 'Technology',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.technologyNews),
  DicoverModel(
      Selected: false,
      name: 'Entertainment',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.entertainmentNews),
  DicoverModel(
      Selected: false,
      name: 'Sport',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.sportNews),
  DicoverModel(
      Selected: false,
      name: 'Science',
      textColor: UiColors.black38,
      bgColor: UiColors.grey200,
      url: Urls.scienceNews),
];
