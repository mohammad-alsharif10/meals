import 'package:flutter/material.dart';
import 'package:meals/utils/dummy_data.dart';
import 'package:meals/utils/screen_size_config.dart';

import '../widgets/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return GridView(
      padding: EdgeInsets.fromLTRB(
          ScreenSizeConfig.blockSizeHorizontal * 3,
          ScreenSizeConfig.blockSizeVertical * 3,
          ScreenSizeConfig.blockSizeHorizontal * 3,
          ScreenSizeConfig.blockSizeHorizontal * 3),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: ScreenSizeConfig.blockSizeHorizontal * 50,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: ScreenSizeConfig.blockSizeHorizontal * 3,
        mainAxisSpacing: ScreenSizeConfig.blockSizeVertical * 3,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              category.id,
              category.title,
              category.color,
            ),
          )
          .toList(),
    );
  }
}
