import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizer_see_previous_projects/controller/organizer_see_previous_projects_controller.dart';

class OrganizerSeePreviousProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizerSeePreviousProjectsController());
   }

}