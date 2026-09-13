import 'package:flutter/material.dart';
import 'package:new_project/core/resources/fonts_manager.dart';

TextStyle _getTextStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
  required String fontFamily,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getRegularStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontsWeight.regular,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getMediumStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontsWeight.medium,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getSemiBoldStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontsWeight.semiBold,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getBoldStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontsWeight.bold,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getLightStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontsWeight.light,
    fontFamily: FontConstants.fontFamily,
  );
}
