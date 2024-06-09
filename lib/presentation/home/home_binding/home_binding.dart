import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/home/home_controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}