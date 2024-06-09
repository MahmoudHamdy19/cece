import 'package:cece/presentation/home/home_binding/home_binding.dart';
import 'package:cece/presentation/home/home_screen.dart';
import 'package:cece/presentation/home/items/forget_password/forgert_password_item.dart';
import 'package:cece/presentation/organizer/organizer_home/binding/organizer_home_binding.dart';
import 'package:cece/presentation/organizer/organizer_home/organizer_home_screen.dart';
import 'package:cece/presentation/organizer/organizer_see_previous_projects/binding/organizer_see_previous_projects_binding.dart';
import 'package:cece/presentation/organizer/organizer_see_previous_projects/organizer_see_previous_projects_screen.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/binding/organizet_create_new_project_binding.dart';
import 'package:cece/presentation/organizer/organizet_update_project/binding/organizer_update_project_binding.dart';
import 'package:cece/presentation/organizer/organizet_update_project/organizer_home_update_screen.dart';
import 'package:cece/presentation/organizer/profile/organizer_edit_profile.dart';
import 'package:cece/presentation/organizer/support_screen/support_binding/support_binding.dart';
import 'package:cece/presentation/organizer/support_screen/support_screen.dart';
import 'package:cece/presentation/programmer/coding_stage/binding/coding_stage_binding.dart';
import 'package:cece/presentation/programmer/coding_stage/contenet_coding_stage.dart';
import 'package:cece/presentation/programmer/show_all_projects/binding/show_all_projects_binding.dart';
import 'package:cece/presentation/programmer/show_all_projects/show_all_projects_screen.dart';
import 'package:cece/presentation/programmer/view_details/details_view.dart';
import 'package:cece/presentation/splash/binding/splash_binding.dart';
import 'package:cece/presentation/splash/splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const String initialRoute = '/start';
  static const String homeScreen = '/auth';
  static const String organizerCreateNewProject = '/organizer/CreateNewProject';
  static const String organizerSeePreviousProjectsScreen = '/organizer/SeePreviousProjectsScreen';
  static const String organizerUpdateProject = '/organizer/UpdateProject';
  static const String organizerProfile = '/organizer/Profile';
  static const String organizerSupport = '/organizer/Support';
  static const String forgetPasswordItem = '/ForgetPasswordItem';
  // programmer
  static const String programmerShowAllProjects = '/Programmer/ShowAllProjects';
  static const String programmerCodingStageView = '/Programmer/CodingStageView';
  static const String programmerDetailsView = '/Programmer/DetailsView';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding()
      ],
      curve: Curves.bounceInOut
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding()
      ]
    ),
    GetPage(
        name: forgetPasswordItem,
        page: () => ForgetPasswordItem(),
        
    ),
    GetPage(
        name: organizerCreateNewProject,
        page:() => OrganizerHomeScreen(),
      bindings: [OrganizerCreateNewProjectBinding(),
        OrganizerHomeBinding()]
    ),
    GetPage(
        name: organizerSeePreviousProjectsScreen,
        page:() => OrganizerSeePreviousProjectsScreen(),
      bindings:[OrganizerSeePreviousProjectsBinding(),
        OrganizerHomeBinding()]
    ),
    GetPage(
        name: organizerUpdateProject,
        page:() => OrganizerHomeUpdateScreen(),
        bindings:[OrganizerUpdateProjectBinding(),
          OrganizerHomeBinding()],
    ),
    GetPage(
      name: organizerProfile,
      page:() => EditProfileView(),
        binding: OrganizerHomeBinding()
    ),
    GetPage(
        name:organizerSupport,
        page:() => SupportScreen(),
        bindings: [SupportBinding(),
          OrganizerHomeBinding()]
    ),
    // programmer
    GetPage(
        name:programmerShowAllProjects,
        page:() => AllProjectView(),
        bindings: [
          ShowAllProjectsBinding()
        ]
    ),
    GetPage(
        name:programmerCodingStageView,
        page:() => ContentCodingStage(),
        bindings: [
          CodingStageBinding()
        ]
    ),
    GetPage(
        name:programmerDetailsView,
        page:() => DetailsView(),
        bindings: []
    ),
  ];

}
