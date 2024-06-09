import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/support_screen/support_controller/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
   }

}