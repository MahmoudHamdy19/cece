import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/programmer/show_all_projects/controller/show_all_projects_controller.dart';

class ShowAllProjectsBinding  extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowAllProjectsController());
  }
}