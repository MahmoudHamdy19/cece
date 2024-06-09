import 'package:flutter/material.dart';
import 'package:cece/core/app_export.dart';

class AppStyle {
  static TextStyle txtGilroyMedium23 = TextStyle(
    color: ColorConstant.blue600,
    fontSize: getFontSize(
      23,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtGilroyMedium24 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtGilroyMedium13 = TextStyle(
    color: ColorConstant.pinkA700,
    fontSize: getFontSize(
      13,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtGilroyMedium19 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      19,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtGilroyMedium16 = TextStyle(
    color: ColorConstant.lightBlue300,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
}
abstract class AppTextStyles {
  /// - weight: w200
  /// - size: 14
  /// - size: 16
  /// - size: 18
  /// - size: 20
  /// - size: 22
  /// - family: cairo
  static TextStyle boldtitles =
  const TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 1.7);

  static TextStyle bold = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );

  /// - weight: w300
  /// - family: cairo
  static TextStyle w300 = const TextStyle(fontWeight: FontWeight.w300, fontSize: 30);

  /// - weight: w400
  /// - family: cairo
  static TextStyle hittext =
  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  /// - weight: w500
  /// - family: cairo
  static TextStyle smTitles =
  const TextStyle(fontWeight: FontWeight.w300, fontSize: 20);

  /// - weight: w600
  /// - family: cairo
  static TextStyle w600 = const TextStyle(fontWeight: FontWeight.w600,fontSize: 16);
  static TextStyle w700 = const TextStyle(fontWeight: FontWeight.w700,fontSize: 14, fontFamily: "HindSiliguri");

  /// - weight: w700
  /// - family: cairo
  static TextStyle lrTitles =
  const TextStyle(fontWeight: FontWeight.w500, fontSize: 22);

  /// - weight: w800
  /// - family: cairo
  static TextStyle w800 = const TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo
  static TextStyle textsmbold =
  const TextStyle(fontWeight: FontWeight.w100, fontSize: 16,);
}
