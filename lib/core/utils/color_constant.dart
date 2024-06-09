import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static  Color cyan100 = fromHex('#c1fdff');

  static  Color yellow500 = fromHex('#ffee37');

  static  Color deepOrangeA200 = fromHex('#ff6332');

  static  Color lightBlue300 = fromHex('#5fcfff');

  static  Color blueA700 = fromHex('#0061ff');

  static  Color pinkA700 = fromHex('#b20d78');

  static  Color blue600 = fromHex('#228aed');

  static  Color deepPurpleA400 = fromHex('#7031fc');

  static  Color deepPurpleA200 = fromHex('#9a4afe');

  static Color deepOrange400 = fromHex('#f78a3b');
  static const grey = Color(0xFFF2F2F2);
  static const lightGrey = Color(0xFFdfe0e1);
  static const mediumGrey = Color(0xFF6F6F6F);
  static const darkGrey = Color(0xFF414042);
  static Color whiteA700 = fromHex('#ffffff');
  static Color black90026 = fromHex('#26000000');
  static Color primaryColor =Color(0xFF1c1d83);
  static Color kPrimaryColor = Color(0xFF366CF6);
  static Color kSecondaryColor = Color(0xFFF5F6FC);
  static Color kBgLightColor = Color(0xFFF2F4FC);
  static Color kBgDarkColor = Color(0xFFEBEDFA);
  static Color kBadgeColor = Color(0xFFEE376E);
  static Color kGrayColor = Color(0xFF8793B2);
  static Color kTitleTextColor = Color(0xFF30384D);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
