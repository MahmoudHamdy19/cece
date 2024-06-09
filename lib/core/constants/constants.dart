import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/components/side_menu.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

List<String> status = [
  'Pending',
  'Accepted',
  'Done',
  'Rejected'
];

List<Color> statusColor = [
  Colors.grey,
  Colors.green,
  Colors.blue,
  Colors.red
];

List<String> organizerCreateNewProject = [
  "Conference Details",
  "Conference Style",
  "Add Collaborators",
  "Registration Ceremony",
  "Closing Ceremony",
  "Exhibition Details",
  "Workshop Details",
  "Paper Session",
  "Panel Discussions Details",
  "Keynote Speaker Details",
  "Preview Application"
];
List<SideMenuItemData> sideMenuItems = [
  SideMenuItemData(
    title: "Create New Project",
    iconData: Iconsax.additem,
    isActive: false,
    showBorder: true,
    itemCount: 3,
    ontap: () {
      Get.offAndToNamed(AppRoutes.organizerCreateNewProject);
    },
  ),
  SideMenuItemData(
    title: "See Previous Projects",
    iconData: Iconsax.building,
    isActive: false,
    showBorder: true,
    itemCount: 0,
    ontap: () {
      Get.offAndToNamed(AppRoutes.organizerSeePreviousProjectsScreen);
    },
  ),
  SideMenuItemData(
    title: "Support",
    iconData: Iconsax.support,
    isActive: false,
    showBorder: true,
    itemCount: 0,
    ontap: () {
      Get.offAndToNamed(AppRoutes.organizerSupport);
    },
  ),
  SideMenuItemData(
    title: "Log Out",
    iconData: Iconsax.logout,
    isActive: false,
    itemCount: 0,
    showBorder: true,
    ontap: () {
      Get.offAndToNamed(AppRoutes.initialRoute);
    },
  ),
];
List<SideMenuItemData> programmerSideMenuItems = [
  SideMenuItemData(
    title: "All Project",
    iconData: Iconsax.document_filter,
    isActive: true,
    showBorder: true,
    itemCount: 3,
    ontap: () {
      Get.offAndToNamed(AppRoutes.programmerShowAllProjects);
    },
  ),
  SideMenuItemData(
    title: "coding stage",
    iconData: Iconsax.code,
    isActive: false,
    showBorder: true,
    itemCount: 0,
    ontap: () {
      Get.offAndToNamed(AppRoutes.programmerCodingStageView);

    },
  ),
  SideMenuItemData(
    title: "Logout",
    iconData: Iconsax.logout,
    isActive: false,
    showBorder: true,
    itemCount: 0,
    ontap: () {
      Get.offAllNamed(AppRoutes.initialRoute);
    },
  ),
];

Map<String, TextStyle> fontListMap = {
  "Cairo": GoogleFonts.cairo(),
  "PtMono": GoogleFonts.ptMono(),
  "PtSans": GoogleFonts.ptSans(),
  "Abel": GoogleFonts.abel(),
  "CourierPrime": GoogleFonts.courierPrime(),
  "Cambay": GoogleFonts.cambay(),
  "Tienne": GoogleFonts.tienne(),
  "Aboreto": GoogleFonts.aboreto(),
  "Acme": GoogleFonts.acme(),
  "caesarDressing": GoogleFonts.caesarDressing(),
  "Fahkwang": GoogleFonts.fahkwang(),
  "VampiroOne": GoogleFonts.vampiroOne(),
  "Habibi": GoogleFonts.habibi(),
  "Yaldevi": GoogleFonts.yaldevi(),
  "Actor": GoogleFonts.actor(),
  "EagleLake": GoogleFonts.eagleLake(),
  "ibarraRealNova": GoogleFonts.ibarraRealNova(),
  "Ubuntu": GoogleFonts.ubuntu(),
  "Damion": GoogleFonts.damion(),
  "Sahitya": GoogleFonts.sahitya(),
};
// dialog for confirm
showConfirmDialog(String title, String content , void Function()? onConfirm) {
  Get.defaultDialog(
    title: title,
    content: Text(content),
    onCancel: () {
      Get.back();
    },
    onConfirm:onConfirm,
  );
}