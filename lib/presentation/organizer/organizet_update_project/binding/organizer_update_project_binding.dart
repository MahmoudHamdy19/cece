import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';

class OrganizerUpdateProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizerUpdateProjectController());
   }

}