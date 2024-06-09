 import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/organizer_app_bar/organizer_app_bar.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_update_project/organizer_update_project_screen.dart';
import 'package:flutter/cupertino.dart';
     import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/components/side_menu.dart';

class OrganizerHomeUpdateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       key:scaffoldKey,
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
                     Row(
                       children: [
                         Align(
                           alignment: Alignment.centerLeft,
                           child: IconButton(onPressed: () {
                             Get.offAndToNamed(AppRoutes.organizerSeePreviousProjectsScreen);
                           } , icon: CircleAvatar(child: Icon(Iconsax.arrow_left))),
                         ),
                         Spacer(),
                         ElevatedButton(onPressed: (){
                           Get.defaultDialog(
                             title: 'Delete Project',
                             middleText: 'Are you sure you want to delete this project?',
                             onConfirm: (){
                               Get.find<OrganizerUpdateProjectController>().deleteConference();
                             },
                           );
                         }, child: Text('Delete Project'),
                           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                         )
                       ],
                     ),
                     SizedBox(height: 20.0,),
                     Container(
                          decoration: BoxDecoration(
                             color: Colors.white, borderRadius: BorderRadius.circular(20)),
                         child: OrganizerUpdateProject())
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
