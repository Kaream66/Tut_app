import 'package:flutter/material.dart';
import 'package:new_project/core/colors_manager.dart';
import 'package:new_project/core/fonts_manager.dart';
import 'package:new_project/core/styles.dart';
import 'package:new_project/core/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorsManager.primaryColor,
    primaryColorLight: ColorsManager.lightPrimary,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1,
    cardTheme: CardThemeData(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: 4.0,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.primaryColor,
      shadowColor: ColorsManager.lightPrimary,
      elevation: 4.0,
      titleTextStyle: getRegularStyle(color: ColorsManager.white, fontSize: 16.0),
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorsManager.primaryColor,
      disabledColor: ColorsManager.grey,
      splashColor: ColorsManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s17),
        backgroundColor: ColorsManager.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getLightStyle(color: ColorsManager.white, fontSize: FontSize.s22),
      headlineLarge: getSemiBoldStyle(color: ColorsManager.darkGrey, fontSize: FontSize.s16),

      bodyLarge: getRegularStyle(color: ColorsManager.grey1),
      bodySmall: getRegularStyle(color: ColorsManager.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorsManager.grey, fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorsManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorsManager.error, fontSize: FontSize.s14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.primaryColor, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
