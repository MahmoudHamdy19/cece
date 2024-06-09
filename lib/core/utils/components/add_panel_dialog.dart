import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/panel_model.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/exhibition_ceremony_tab.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'default_form_faild.dart';
import 'dropdown_input.dart';

class AddPanelDialog extends GetWidget<OrganizerCreateNewProjectController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController topicController = TextEditingController();
  final TextEditingController moderatorController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

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
                    'Panel Content',
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
                        PanelModel p = PanelModel(
                          endDate: endDateController.text,
                          hall: hallController.text,
                          startDate: startDateController.text ,
                          topic: topicController.text ,
                          id: controller.panelModel.length.toString() ,
                          moderatorProfile: moderatorController.text ,
                          participantProfile: moderatorController.text ,
                        );
                        controller.panelModel.add(p);
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
                controller: topicController,
                hintText: "Topic",
                title: "Topic",
                prefixIcon: Icons.topic_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Topic';
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
                    child: DropdownInput<String>(
                        name: "Moderator's Full Name",
                      label: "Moderator's Full Name",
                      leadingIcon: Iconsax.user,
                      validator: (value) {
                        moderatorController.text = value!;
                        return null;
                      },
                      leadingIconColor: ColorConstant.primaryColor,
                      items: controller.moderators.map((element) => DropdownMenuItem<String>(
                        value: element.id,
                          child: Text('${element.firstName} ${element.lastName}'))).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child: DropdownInput<String>(
                       name: "Participant's Full Name",
                      label: "Enter Participant's Full Name",
                      leadingIcon: Iconsax.user,
                      leadingIconColor: ColorConstant.primaryColor,
                      validator: (value) {
                        participantController.text  = value!;
                        return null;
                      },
                      items: controller.participants.map((element) => DropdownMenuItem<String>(
                          value: element.id,
                          child: Text('${element.firstName} ${element.lastName}'))).toList(),
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
                        _selectTime(context, startTimeController);
                      },
                      child: DefaultFormField(
                        controller: startTimeController,
                        labelText: "Start Time",
                        title: 'Start Time',
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
                        _selectTime(context, endTimeController);
                      },
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: "End Time",
                        title: 'End Time',
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
                        _selectDate(context, startDateController);
                      },
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: "Start Date",
                        title: 'Start Date',
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
                        _selectEndDate(context, endDateController)  ;
                      },
                      child: DefaultFormField(
                        controller: endDateController,
                        labelText: "End Date",
                        title: 'End Date',
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

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controllers) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controllers.text)??controller.startDate.value,
      firstDate: controller.startDate.value!,
      lastDate:controller.endDate.value!,
    );
    if (picked != null) {
      controllers.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectEndDate(BuildContext context, TextEditingController controllers) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controllers.text)??controller.startDate.value,
      firstDate:controller.startDate.value!,
      lastDate:controller.endDate.value!,
    );
    if (picked != null) {
      controllers.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }


}

class UpdatePanelDialog extends GetWidget<OrganizerUpdateProjectController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController topicController = TextEditingController();
  final TextEditingController moderatorController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

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
                    'Panel Content',
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
                        PanelModel p = PanelModel(
                          endDate: endDateController.text,
                          hall: hallController.text,
                          startDate: startDateController.text ,
                          topic: topicController.text ,
                          id: controller.panelModel.length.toString() ,
                          moderatorProfile: moderatorController.text ,
                          participantProfile: moderatorController.text ,
                        );
                        controller.panelModel.add(p);
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
                controller: topicController,
                hintText: "Topic",
                title: "Topic",
                prefixIcon: Icons.topic_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Topic';
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
                    child: DropdownInput<String>(
                      name: "Moderator's Full Name",
                      label: "Moderator's Full Name",
                      leadingIcon: Iconsax.user,
                      validator: (value) {
                        moderatorController.text = value!;
                        return null;
                      },
                      leadingIconColor: ColorConstant.primaryColor,
                      items: controller.moderators.map((element) => DropdownMenuItem<String>(
                          value: element.id,
                          child: Text('${element.firstName} ${element.lastName}'))).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 66,
                  ),
                  Expanded(
                    child: DropdownInput<String>(
                      name: "Participant's Full Name",
                      label: "Enter Participant's Full Name",
                      leadingIcon: Iconsax.user,
                      leadingIconColor: ColorConstant.primaryColor,
                      validator: (value) {
                        participantController.text  = value!;
                        return null;
                      },
                      items: controller.participants.map((element) => DropdownMenuItem<String>(
                          value: element.id,
                          child: Text('${element.firstName} ${element.lastName}'))).toList(),
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
                        _selectTime(context, startTimeController);
                      },
                      child: DefaultFormField(
                        controller: startTimeController,
                        labelText: "Start Time",
                        title: 'Start Time',
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
                        _selectTime(context, endTimeController);
                      },
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: "End Time",
                        title: 'End Time',
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
                        _selectDate(context, startDateController);
                      },
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: "Start Date",
                        title: 'Start Date',
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

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controllers) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controllers.text)?? controller.startDate.value,
      firstDate:  controller.startDate.value!,
      lastDate:  controller.endDate.value!,
    );
    if (picked != null) {
      controllers.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
