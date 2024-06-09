import 'dart:typed_data';
import 'package:cece/core/app_export.dart';
 import 'package:flutter/material.dart';
  import 'package:iconsax/iconsax.dart';
 import '../../../../core/utils/components/default_form_faild.dart';
import '../../../../core/utils/components/picture_source_button.dart';
 import '../controller/organizer_create_new_project_controller.dart';

class ConferenceDetailsWidget extends GetWidget<OrganizerCreateNewProjectController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createNewProjectTabs(controller,context,"Conference Details"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: DefaultFormField(
                         title: "Conference Name",
                        prefixIcon: Icons.title_outlined,
                        validator: (value) => value?.isEmpty ?? true ? 'Please enter conference name' : null,
                        hintText: "Conference Name",
                        controller: controller.conferenceNameController,
                       ),
                    ),
                    const SizedBox(width: 50),
                    Flexible(
                      child: DefaultFormField(
                         title: "Description",
                        prefixIcon: Icons.description_outlined,
                        validator: (value) =>
                        value?.isEmpty ?? true ? 'Please enter a description for the conference' : null,
                        hintText: "Description",
                        controller: controller.conferenceDescriptionController,
                       ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: DefaultFormField(
                         title: "City",
                        prefixIcon: Icons.location_city_outlined,
                        validator: (value) => value?.isEmpty ?? true ? 'Please enter the city' : null,
                        hintText: "City",
                        controller: controller.cityController,
                       ),
                    ),
                    const SizedBox(width: 50),
                    Flexible(
                      child: DefaultFormField(
                         title: "Venue",
                        prefixIcon: Icons.location_on_outlined,
                        validator: (value) => value?.isEmpty ?? true ? 'Please enter the venue' : null,
                        hintText: "Venue",
                        controller: controller.venueController,
                       ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          controller.startDate.value = (await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          ));
                          if (controller.startDate.value != null)
                            controller.conferenceStartDateController.text = controller.startDate.value?.format()??"";
                        },
                        child: DefaultFormField(
                          controller: controller.conferenceStartDateController,
                          labelText: "Start Date",
                          title: 'Start Date',
                          enabled: false,
                          prefixIcon: Icons.timer_outlined,
                          readOnly: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 66,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                         controller.endDate.value = (await showDatePicker(
                            context: context,
                            firstDate: controller.startDate.value!.add(Duration(days: 1)),
                            initialDate: controller.startDate.value!.add(Duration(days: 1)),
                            lastDate: DateTime(2101),
                          ));
                          if (controller.endDate.value != null)
                            controller.conferenceEndDateController.text =  controller.endDate.value?.format()??'';
                        },
                        child: DefaultFormField(
                          controller: controller.conferenceEndDateController,
                          labelText: "End Date",
                          title: 'End Date',
                          enabled: false,
                          prefixIcon: Icons.timer_outlined,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(

                    'Logo must be of size 200 x 200 pixels and in PNG or JPG format',
                  ),
                ),

                const SizedBox(height: 15),
                PictureSourceButton(
                  icon: Iconsax.camera,
                  label: 'Upload / Logo',
                  onTap: () => controller.pickConferenceImage(),
                ),
                const SizedBox(height: 15),
                Obx(
                      () => Visibility(
                    visible: controller.conferenceImageUint8List.value != null,
                    child: SizedBox(
                      height: 250,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(controller.conferenceImageUint8List.value ?? Uint8List(0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

createNewProjectTabs(controller,context,String title)=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorConstant.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {
        controller.pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
       child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           const Icon(Iconsax.arrow_left_1, color: Colors.white),
           Text(
            "Previous",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                   ),
         ],
       ),
    ),
    Text(
      title,
      style: AppTextStyles.w700.copyWith(fontSize: 20),
    ),
    ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorConstant.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {
        controller.pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Next",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          Icon(Iconsax.arrow_right_1, color: Colors.white),
        ],
      ),
    ),
  ],
);