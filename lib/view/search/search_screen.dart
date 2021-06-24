import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiro_study/controller/search_controller.dart';
import 'package:spiro_study/src/custom_colors.dart';
import 'package:spiro_study/view/component/item_view.dart';
import 'package:spiro_study/view/component/search_bar.dart';
import 'package:spiro_study/view/details_screen.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShowColors.purple_500,
        leading: IconButton(
          onPressed: () {
            searchController.searchResult.clear();
            Get.back(closeOverlays: true);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: SearchBar(
          textEditingController: textEditingController,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: ShowColors.colorTextIcons,
              ),
              onPressed: () {
                searchController.getSearchResult(
                    query: textEditingController.text);
              }),
        ],
      ),
      backgroundColor: ShowColors.purple_200,
      body: Obx(
        () => searchController.isSearching.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: searchController.searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemView(
                    onTap: () {
                      print('Index Click $index');
                      Get.to(DetailScreen(searchModel: searchController.searchResult[index],));
                    },
                    searchModel: searchController.searchResult[index],
                  );
                },
              ),
      ),
    );
  }
}
