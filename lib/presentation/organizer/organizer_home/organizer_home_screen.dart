 import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/organizer_app_bar/organizer_app_bar.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/organizer/organizer_home/controller/organizer_home_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/organizer_create_new_project_screen.dart';
  import 'package:flutter/material.dart';

import '../../../core/utils/components/side_menu.dart';

class OrganizerHomeScreen extends GetWidget<OrganizerHomeController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       key:scaffoldKey,
       backgroundColor: ColorConstant.kBgLightColor,
       drawer: Drawer(
         child: SideMenu(0),
       ),
       body: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Visibility(
             visible:isDesktop(context),
             child: SizedBox(
               width:MediaQuery.of(context).size.width*0.15,
                child:  SideMenu(0),
             ),
           ),
           SizedBox(
             width:MediaQuery.of(context).size.width*0.85,
             child: Padding(
               padding:EdgeInsets.all(isDesktop(context)?20.0:0),
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     OrganizerAppBarView(),
                     SizedBox(height: 20.0,),
                     Container(
                          decoration: BoxDecoration(
                             color: Colors.white, borderRadius: BorderRadius.circular(20)),
                         child: OrganizerCreateNewProject())
                   ],
                 ),
               ),
             ),
           ),
         ],
       )
    );
  }
}
