import '../../../../core/app_export.dart';
import '../controller/organizer_create_new_project_controller.dart';

class  OrganizerCreateNewProjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizerCreateNewProjectController());
  }

}