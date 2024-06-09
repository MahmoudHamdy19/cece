import 'dart:async';

import 'package:cece/core/app_export.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.homeScreen,parameters:{
        'page':'0'
      });
    });
    super.onInit();
  }

}