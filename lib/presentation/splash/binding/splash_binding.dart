import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}