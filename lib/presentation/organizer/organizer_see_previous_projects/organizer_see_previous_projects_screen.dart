 import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/organizer_app_bar/organizer_app_bar.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/organizer/organizer_see_previous_projects/controller/organizer_see_previous_projects_controller.dart';
 import 'package:cece/presentation/organizer/organizer_see_previous_projects/see_previous_project_item.dart';
   import 'package:flutter/material.dart';

import '../../../core/utils/components/side_menu.dart';

class OrganizerSeePreviousProjectsScreen extends GetWidget<OrganizerSeePreviousProjectsController>{

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       key: scaffoldKey,
       backgroundColor: ColorConstant.kBgLightColor,
       drawer: Drawer(
         child: SideMenu(1),
       ),
       body: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Visibility(
             visible:isDesktop(context),
             child: SizedBox(
               width:MediaQuery.of(context).size.width*0.15,
                child:  SideMenu(1),
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
                       child: Obx(()=>controller.state.value.getScreenWidget(SeePreviousProjectItem(), (){})),
                         )
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
