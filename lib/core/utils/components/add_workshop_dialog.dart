import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/workshop_model.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/exhibition_ceremony_tab.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
 import 'default_form_faild.dart';
import 'dropdown_input.dart';

class AddWorkshopDialog extends GetWidget<OrganizerCreateNewProjectController> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController presenterController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workshop Content',
                      style: AppTextStyles.w700.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          iconColor: Colors.white,
                          backgroundColor: ColorConstant.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var wsModel = WorkshopModel(
                              id: controller.workshopModel.length.toString() ,
                              endDate: endDateController.text ,
                              endTime: endTimeController.text ,
                              hall: hallController.text ,
                              language:  languageController.text,
                              presenter: presenterController.text ,
                              startDate: startDateController.text ,
                              startTime: startTimeController.text,
                              topic: topicController.text,
                            );
                            controller.workshopModel.add(wsModel);
                            Get.back();
                          }
                        },
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultFormField(
                        controller: topicController,
                        hintText: "Topic",
                        title: "Topic",
                        prefixIcon: Icons.topic_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Topic';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 66,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        controller: languageController,
                        hintText: "Language",
                        title: "Language",
                        prefixIcon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Language';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Presenter Name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownInput<String>(
                  name: "Presenter's Full Name",
                  label: "Presenter's Full Name",
                  leadingIcon: Iconsax.user,
                  leadingIconColor: ColorConstant.primaryColor,
                  items:
                  controller.presenters.map((element) =>  DropdownMenuItem(
                    value: element.id,
                    child: Text('${element.firstName} ${element.lastName}'),
                  ),).toList(),
                  validator: (value) {
                    presenterController.text = value!;

                    return null;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null)
                            startTimeController.text = picked.format(context);
                        },
                        child: DefaultFormField(
                          controller: startTimeController,
                          labelText: "Start Time",
                          title: 'Start Time',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
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
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null)
                            endTimeController.text = picked.format(context);
                        },
                        child: DefaultFormField(
                          controller: endTimeController,
                          labelText: "End Time",
                          title: 'End Time',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.tryParse(startDateController.text)?? controller.startDate.value!,
                            firstDate:  controller.startDate.value!,
                            lastDate:  controller.endDate.value!,
                          );
                          if (picked != null)
                            startDateController.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                        },
                        child: DefaultFormField(
                          controller: startDateController,
                          labelText: "startDate",
                          title: 'Start Date',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
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
                          final DateTime? picked = await showDatePicker(
                            context: context,
                             firstDate:firstDateEndCheck(startDateController),
                            lastDate: controller.endDate.value!,
                          );
                          if (picked != null)
                            endDateController.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                        },
                        child: DefaultFormField(
                          controller: endDateController,
                          labelText: "End Date",
                          title: 'End Date',
                          prefixIcon: Icons.date_range_outlined,
                          enabled: false,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultFormField(
                  controller: hallController,
                  hintText: "Enter Hall",
                  title: "Hall",
                  prefixIcon: Icons.location_city_outlined,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Hall';
                    }
                    return null;
                  },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class UpdateWorkshopDialog extends GetWidget<OrganizerUpdateProjectController> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController presenterController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workshop Ceremony',
                      style: AppTextStyles.w700.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          iconColor: Colors.white,
                          backgroundColor: ColorConstant.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var wsModel = WorkshopModel(
                              id: controller.workshopModel.length.toString() ,
                              endDate: endDateController.text ,
                              endTime: endTimeController.text ,
                              hall: hallController.text ,
                              language:  languageController.text,
                              presenter: presenterController.text ,
                              startDate: startDateController.text ,
                              startTime: startTimeController.text,
                              topic: topicController.text,
                            );
                            controller.workshopModel.add(wsModel);
                            Get.back();
                          }
                        },
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultFormField(
                        controller: topicController,
                        hintText: "Topic",
                        title: "Topic",
                        prefixIcon: Icons.topic_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Topic';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 66,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        controller: languageController,
                        hintText: "Language",
                        title: "Language",
                        prefixIcon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Language';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Presenter Name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownInput<String>(
                  name: "Presenter's Full Name",
                  label: "Presenter's Full Name",
                  leadingIcon: Iconsax.user,
                  leadingIconColor: ColorConstant.primaryColor,
                  items:
                  controller.presenters.map((element) =>  DropdownMenuItem(
                    value: element.id,
                    child: Text('${element.firstName} ${element.lastName}'),
                  ),).toList(),
                  validator: (value) {
                    presenterController.text = value!;

                    return null;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null)
                            startTimeController.text = picked.format(context);
                        },
                        child: DefaultFormField(
                          controller: startTimeController,
                          labelText: "startTime",
                          title: 'Start work',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
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
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null)
                            endTimeController.text = picked.format(context);
                        },
                        child: DefaultFormField(
                          controller: endTimeController,
                          labelText: "endTime",
                          title: 'End work',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.tryParse(startDateController.text),
                            firstDate: controller.startDate.value!,
                            lastDate:controller.endDate.value!,
                          );
                          if (picked != null)
                            startDateController.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                        },
                        child: DefaultFormField(
                          controller: startDateController,
                          labelText: "startDate",
                          title: 'Start Date',
                          prefixIcon: Icons.timer_outlined,
                          enabled: false,
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
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.tryParse(endDateController.text)??controller.endDate.value,
                            firstDate: controller.startDate.value!,
                            lastDate: controller.endDate.value!,
                          );
                          if (picked != null)
                            endDateController.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                        },
                        child: DefaultFormField(
                          controller: endDateController,
                          labelText: "endDate",
                          title: 'End Date',
                          prefixIcon: Icons.date_range_outlined,
                          enabled: false,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultFormField(
                  controller: hallController,
                  hintText: "Enter Hall",
                  title: "Hall",
                  prefixIcon: Icons.location_city_outlined,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Hall';
                    }
                    return null;
                  },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
