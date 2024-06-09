import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/organizer/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/utils/components/default_form_faild.dart';
import '../../../core/utils/components/side_menu.dart';

class EditProfileView extends GetWidget<ProfileController>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Profile',style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          if(Get.isPopGestureEnable){
            Get.back();
          }else {
            Get.offAllNamed(AppRoutes.organizerCreateNewProject);
          }
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: ColorConstant.kBgLightColor,
      key: _scaffoldKey,
      body: Obx(
          ()=> controller.state.value.getScreenWidget(_body(context), (){
            controller.getProfile() ;
          }),
      ),
    );
  }

  _body(context)=>Obx(
      ()=> SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.isEditing.value
                              ? "Edit Profile"
                              : "My Profile",
                          style: AppTextStyles.w700
                              .copyWith(fontSize: 20),
                        ),
                        controller.isEditing.value
                            ? ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            iconColor: Colors.white,
                            backgroundColor:
                            ColorConstant.primaryColor,
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal:
                              20,
                              vertical: 5,
                            ),
                          ),
                          onPressed: () {
                            controller.updateProfile();
                          },
                          icon: const Icon(
                            Iconsax.send_14,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Save",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                            : ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            iconColor: Colors.white,
                            backgroundColor:
                            ColorConstant.primaryColor,
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal:
                              20,
                              vertical: 5,
                            ),
                          ),
                          onPressed: () {
                            controller.editMode();

                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Edit",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              DefaultFormField(
                                controller: controller.firstnameController,
                                enabled: controller.isEditing.value,
                                hintText: "First Name",
                                prefixIcon: Iconsax.personalcard,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              DefaultFormField(
                                enabled: controller.isEditing.value,
                                controller: controller.lastnameController,
                                hintText: "Last Name",
                                prefixIcon: Iconsax.personalcard,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              DefaultFormField(
                                hintText: "Email",
                                enabled: false,
                                controller: controller.emailController,
                                prefixIcon: Iconsax.message,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
