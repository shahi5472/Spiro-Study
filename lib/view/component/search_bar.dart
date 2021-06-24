import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiro_study/controller/search_controller.dart';
import 'package:spiro_study/src/strings.dart';
import 'package:spiro_study/utility/size_config.dart';

class SearchBar extends StatelessWidget {
  TextEditingController? textEditingController;

  SearchBar({this.textEditingController});

  SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          searchController.isSearching.value = true;
          searchController.getSearchResult(query: value);
        } else {
          searchController.isSearching.value = false;
          searchController.getSearchResult(query: null);
        }
      },
      textAlign: TextAlign.start,
      controller: textEditingController,
      style: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.textMultiplier! * 2.4,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: SizeConfig.heightMultiplier! * 2.1,
            bottom: SizeConfig.heightMultiplier! * 2.1),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        border: InputBorder.none,
        filled: true,
        hintText: searchText,
        hintStyle: TextStyle(
          fontSize: SizeConfig.textMultiplier! * 2.4,
          color: Colors.grey,
        ),
      ),
    );
  }
}
