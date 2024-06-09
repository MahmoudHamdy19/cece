import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/App Colors.dart';
import '../Utils/App Textstyle.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  platform: TargetPlatform.iOS,
  fontFamily: "PTSans",
  primaryColor: AppColors.primaryColor,
  canvasColor: Colors.transparent,
  iconTheme:   IconThemeData(color: AppColors.primaryColor, size: 25),
  primarySwatch: Colors.orange,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    toolbarHeight: 50,
    elevation: 0,
    surfaceTintColor: AppColors.backgroundColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.black, size: 22),
    titleTextStyle: AppTextStyles.bold.copyWith(
      color: AppColors.primaryColor,
      fontFamily: "PTSans",
    ),
  ),
);
