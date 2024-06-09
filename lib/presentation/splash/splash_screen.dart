import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImageConstant.logo),
    );
  }
}
