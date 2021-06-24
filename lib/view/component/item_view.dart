import 'package:flutter/material.dart';
import 'package:spiro_study/model/search_model.dart';
import 'package:spiro_study/src/custom_colors.dart';
import 'package:spiro_study/utility/size_config.dart';

class ItemView extends StatelessWidget {
  SearchModel? searchModel;

  VoidCallback? onTap;

  ItemView({this.searchModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.amber,
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier! * 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: ShowColors.colorPrimaryLight,
                  elevation: 6,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier! * 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier! * 1.5),
                          child: Text(
                            '${searchModel == null ? 'Title' : searchModel!.title ?? ''}',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier! * 2,
                              color: ShowColors.colorTextIcons,
                              fontWeight: FontWeight.w900,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier! * 0.5),
                          child: Text(
                            '${searchModel == null ? 'Name' : searchModel!.category!.name ?? ''}',
                            style: TextStyle(
                                color: ShowColors.colorTextOther,
                                fontSize: SizeConfig.textMultiplier! * 1.6,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier! * 0.5),
                          child: Text(
                            '${searchModel == null ? 'Description' : searchModel!.description}',
                            style: TextStyle(
                                color: ShowColors.colorTextPrimary,
                                fontSize: SizeConfig.textMultiplier! * 1.6,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier! * 0.5),
                          child: Text(
                            'Total Views (${searchModel == null ? '0' : searchModel!.video!.views.toString()})',
                            style: TextStyle(
                                color: ShowColors.holo_green_light,
                                fontSize: SizeConfig.textMultiplier! * 1.6,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier! * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier! * 4.585,
                    top: SizeConfig.heightMultiplier! * 0.49),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
                    fit: BoxFit.fill,
                    height: SizeConfig.heightMultiplier! * 15.8,
                    width: SizeConfig.widthMultiplier! * 22.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
