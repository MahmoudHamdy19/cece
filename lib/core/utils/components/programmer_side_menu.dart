
import 'package:cece/core/app_export.dart';
 import 'package:cece/core/utils/components/side_menu_item.dart';
import 'package:flutter/material.dart';

class ProgrammerSideMenu extends StatelessWidget {
 int currentTabIndex ;

 ProgrammerSideMenu(this.currentTabIndex);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top:30),
      color: ColorConstant.kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.logo,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              const Divider(height: 10, color: ColorConstant.lightGrey, thickness: 3,),
              const SizedBox(height: 10),
              // Menu Items
              Column(
                  children:programmerSideMenuItems.asMap().map((index, e) {
                    return MapEntry(index, SideMenuItem(
                      isActive:currentTabIndex == index,
                      itemCount: e.itemCount,
                      iconSrc: e.iconData,
                      title: e.title,
                      press:e.ontap??(){

                      },
                    ));
                  }).values.toList()
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class SideMenuItemData {
  final String title;
  final IconData iconData;
  final bool isActive;
  final int itemCount;
  final bool showBorder;

  SideMenuItemData({
    required this.title,
    required this.iconData,
    required this.isActive,
    required this.itemCount,
    this.showBorder = false,
  });
}
