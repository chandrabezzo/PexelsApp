import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pexels/core/styles/colors.dart';

class Styles {
  static ThemeData themeData(BuildContext context){
    return ThemeData(
      primaryColor: colorPrimary,
      fontFamily: "Montserrat"
    );
  } 

  static CupertinoThemeData iosThemeData(BuildContext context){
    return CupertinoThemeData(
      primaryColor: colorPrimary
    );
  }
}