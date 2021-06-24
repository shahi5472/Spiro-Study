import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiro_study/controller/search_controller.dart';
import 'package:spiro_study/src/custom_colors.dart';
import 'package:spiro_study/src/strings.dart';
import 'package:spiro_study/utility/size_config.dart';
import 'package:spiro_study/view/component/item_view.dart';
import 'package:spiro_study/view/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShowColors.purple_500,
        title: Text(
          appName,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier! * 2.2,
            color: ShowColors.colorTextIcons,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 12),
            icon: Icon(
              Icons.search,
              color: ShowColors.colorTextIcons,
            ),
            onPressed: () {
              Get.to(SearchScreen());
            },
          ),
        ],
      ),
      backgroundColor: ShowColors.purple_200,
      body: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ItemView();
          },
        ),
      ),
    );
  }
}
