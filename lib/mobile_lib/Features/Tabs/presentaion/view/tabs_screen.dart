 import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/mobile_lib/Features/Tabs/presentaion/view/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:cece/mobile_lib/Features/Tabs/presentaion/view/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../presentation/organizer/organizet_update_project/items/preview_item.dart';
import '../../../Activities/presentaion/view/activities_view.dart';
import '../../../home/presentaion/view/HomeScreen.dart';
import '../../../profile/presentaion/view/ProfileScreen.dart';
import '../manger/tabs_controller.dart';
 class TabsScreen extends GetWidget<TabsController>{
   OrganizerEvents? conference ;

   TabsScreen(this.conference);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                RestartWidget.restartApp(context);
              },
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: LazyIndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomeScreen(conference: conference,),
              ActivitiesScreen(conference),
              ProfileScreen(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: controller.selectedIndex.value,
           onTap: (index) {
             controller.toggleIndex(index);
          },
          items:   [
            CustomBottomNavigationBarItem(
              selected: controller.selectedIndex.value == 0 ,
            //  selected: state.index == 0,
              label: 'Home',
              icon: Iconsax.home,
              coloredIcon: Iconsax.home1,
            ),
            CustomBottomNavigationBarItem(
              selected: controller.selectedIndex.value == 1 ,
              label: 'Activities',
              icon: Iconsax.activity,
              coloredIcon: Iconsax.bill1,
            ),
            CustomBottomNavigationBarItem(
              selected: controller.selectedIndex.value == 2 ,
              label: 'Profile',
              icon: Iconsax.user,
              coloredIcon: Iconsax.user,
            ),
          ],
        ),
      ),
    );
  }
}
