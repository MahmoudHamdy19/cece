import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget{
  int index;

  SideMenu(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
       child: Column(
         children: [
           SizedBox(height: 20.0,),
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
           const Divider(
             height: 10,
             color: ColorConstant.lightGrey,
             thickness: 3,
           ),
           const SizedBox(height: 10),
           // Menu Items
           Column(children: [
             for(int i=0;i<sideMenuItems.length;i++)
             SideMenuItem(
               isActive: i == index,
               itemCount:sideMenuItems[i].itemCount,
               iconSrc:sideMenuItems[i].iconData,
               title:sideMenuItems[i].title,
               press:sideMenuItems[i].ontap??(){},
             )
           ],)
          ],
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
  final Function()? ontap;

  SideMenuItemData({
    required this.title,
    required this.iconData,
    required this.isActive,
    required this.itemCount,
    this.ontap,
    this.showBorder = false,
  });
}
