import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/organizer/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrganizerAppBarView extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: !isDesktop(context)
              ? Builder(builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                })
              : null,
          title: Obx(
            () => Text(
              "Welcome ${controller.user.value?.name}!",
              style: AppTextStyles.w700.copyWith(fontSize: 20),
            ),
          ),
          trailing: ElevatedButton.icon(
            style: TextButton.styleFrom(
              iconColor: Colors.white,
              backgroundColor: ColorConstant.primaryColor,
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.organizerProfile);
            },
            icon: const Icon(
              Iconsax.personalcard,
              color: Colors.white,
            ),
            label: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
