import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/keynote_model.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/exhibition_ceremony_tab.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'default_form_faild.dart';
import 'dropdown_input.dart';

class AddKeynoteDialog extends GetWidget<OrganizerCreateNewProjectController> {
  final TextEditingController speakerNameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController topicNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Keynote Speaker Content',
                    style: AppTextStyles.w700.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
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
                        KeynoteModel kn = KeynoteModel(
                          startDate:  startDateController.text ,
                          hall: hallController.text ,
                          endDate: endDateController.text ,
                          language: languageController.text ,
                          startTime: startTimeController.text ,
                          endTime: endTimeController.text ,
                          id: controller.keynoteModel.length.toString(),
                          speakerName: speakerNameController.text ,
                          topicName: topicNameController.text
                        );
                        controller.keynoteModel.add(kn);
                        Get.back();
                       }
                    },
                    icon: const Icon(
                      Iconsax.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultFormField(
                controller: topicNameController,
                hintText: "Enter Topic Name",
                title: "Topic Name",
                prefixIcon: Icons.topic_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Topic Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultFormField(
                      controller: languageController,
                      hintText: "Enter Language",
                      title: "Language",
                      prefixIcon: Icons.location_on_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter language';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child:  DropdownInput<String>(
                      name: "Speaker's Full Name",
                      label: "Speaker's Full Name",
                      leadingIcon: Iconsax.user,
                      leadingIconColor: ColorConstant.primaryColor,
                      items: controller.speakers.map((element) => DropdownMenuItem<String>(
                          value: element.id,
                          child:Text('${element.firstName} ${element.lastName}'))).toList(),
                      validator: (value) {
                        speakerNameController.text = value ?? '';
                        return null;
                      },

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
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            startTimeController.text = value.format(context);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: startTimeController,
                        labelText: 'Start Time',
                        prefixIcon: Icons.timer_outlined,
                        readOnly: true,
                        enabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            endTimeController.text = value.format(context);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: 'End Time',
                        prefixIcon: Icons.timer_outlined,
                        readOnly: true,
                       enabled: false,
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
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.tryParse(startDateController.text)??controller.startDate.value,
                          firstDate: controller.startDate.value!,
                          lastDate:controller.endDate.value!,
                        ).then((value) {
                          if (value != null) {
                            startDateController.text =
                                DateFormat('yyyy-MM-dd').format(value);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: 'Start Date',
                        prefixIcon: Icons.date_range_outlined,
                        readOnly: true,
                       enabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                           firstDate: firstDateEndCheck(startDateController),
                          lastDate: controller.endDate.value!,
                        ).then((value) {
                          if (value != null) {
                            endDateController.text =
                                DateFormat('yyyy-MM-dd').format(value);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: endDateController,
                        labelText: 'End Date',
                        prefixIcon: Icons.date_range_outlined,
                        readOnly: true,
                      enabled: false,
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
                hintText: "Enter Hall Name",
                title: "Hall",
                prefixIcon: Icons.location_city_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Hall';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class UpdateKeynoteDialog extends GetWidget<OrganizerUpdateProjectController> {
  final TextEditingController speakerNameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController topicNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Keynote Speaker Content',
                    style: AppTextStyles.w700.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
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
                        KeynoteModel kn = KeynoteModel(
                            startDate:  startDateController.text ,
                            hall: hallController.text ,
                            endDate: endDateController.text ,
                            language: languageController.text ,
                            startTime: startTimeController.text ,
                            endTime: endTimeController.text ,
                            id: controller.keynoteModel.length.toString(),
                            speakerName: speakerNameController.text ,
                            topicName: topicNameController.text
                        );
                        controller.keynoteModel.add(kn);
                        Get.back();
                      }
                    },
                    icon: const Icon(
                      Iconsax.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultFormField(
                controller: topicNameController,
                hintText: "Enter Topic Name",
                title: "Topic Name",
                prefixIcon: Icons.topic_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Topic Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultFormField(
                      controller: languageController,
                      hintText: "Enter Language",
                      title: "Language",
                      prefixIcon: Icons.location_on_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter language';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child:  DropdownInput<String>(
                      name: "Speaker's Full Name",
                      label: "Speaker's Full Name",
                      leadingIcon: Iconsax.user,
                      leadingIconColor: ColorConstant.primaryColor,
                      items: controller.speakers.map((element) => DropdownMenuItem<String>(
                          value: element.id,
                          child:Text('${element.firstName} ${element.lastName}'))).toList(),
                      validator: (value) {
                        speakerNameController.text = value ?? '';
                        return null;
                      },

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
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            startTimeController.text = value.format(context);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: startTimeController,
                        labelText: 'Start work',
                        prefixIcon: Icons.timer_outlined,
                        readOnly: true,
                        enabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            endTimeController.text = value.format(context);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: 'End Work',
                        prefixIcon: Icons.timer_outlined,
                        readOnly: true,
                        enabled: false,
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
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.tryParse(startDateController.text)??controller.startDate.value,
                          firstDate: controller.startDate.value!,
                          lastDate:controller.endDate.value!,
                        ).then((value) {
                          if (value != null) {
                            startDateController.text =
                                DateFormat('yyyy-MM-dd').format(value);
                          }
                        });
                      },
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: 'Start Date',
                        prefixIcon: Icons.date_range_outlined,
                        readOnly: true,
                        enabled: false,
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
                          initialDate: DateTime.tryParse(endDateController.text)??controller.endDate.value,
                          lastDate: DateTime(2101),
                        );
                        if (picked != null)
                          endDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                      },
                      child: DefaultFormField(
                        controller: endDateController,
                        labelText: 'End Date',
                        prefixIcon: Icons.date_range_outlined,
                        readOnly: true,
                        enabled: false,
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
                hintText: "Enter Hall Name",
                title: "Hall",
                prefixIcon: Icons.location_city_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Hall';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
