import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiro_study/src/strings.dart';
import 'package:spiro_study/utility/size_config.dart';
import 'package:spiro_study/view/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          SizeConfig().init(constraints, orientation);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData.light(),
            home: HomeScreen(),
          );
        });
      },
    );
  }
}
