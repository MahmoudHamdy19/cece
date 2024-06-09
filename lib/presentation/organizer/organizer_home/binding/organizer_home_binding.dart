import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizer_home/controller/organizer_home_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';

import '../../profile/controller/profile_controller.dart';

class OrganizerHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizerHomeController());
    Get.lazyPut(() =>ProfileController());
  }

}