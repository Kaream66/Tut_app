import 'package:flutter/material.dart';
import 'package:new_project/presentation/colors_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorsManager.primaryColor,
    primaryColorLight: ColorsManager.lightPrimary,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1, // for disabled button
  );
}
