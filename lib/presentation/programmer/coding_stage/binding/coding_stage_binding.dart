import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/programmer/coding_stage/controller/coding_stage_controller.dart';

class CodingStageBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => CodingStageController());
  }


}