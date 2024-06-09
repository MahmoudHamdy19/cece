import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../data/models/conference/papar_model.dart';
import '../../../presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import '../../../presentation/organizer/organizet_create_new_project/items/exhibition_ceremony_tab.dart';
import '../../app_export.dart';
import 'default_form_faild.dart';
import 'dropdown_input.dart';

class AddPaperDialog extends GetWidget<OrganizerCreateNewProjectController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: DateTime.tryParse(startDateController.text)??controller.startDate.value!,
        firstDate:controller.startDate.value!,
        lastDate: controller.endDate.value!,);
    if (picked != null) {
      startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await selectDate(context);
    if (picked != null) {
      endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    );
    if (picked != null) {
      startTimeController.text = picked.format(context);
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      endTimeController.text = picked.format(context);
    }
  }

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
                    'Paper Session',
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
                          PaperModel pp = PaperModel(
                            startDate: startDateController.text,
                            language: languageController.text,
                            id: controller.paperModel.length.toString(),
                            hall: hallController.text,
                            endDate: endDateController.text,
                            authorProfile: authorController.text,
                            title: titleController.text,
                          );
                          controller.paperModel.add(pp);
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
              Text(
                'Paper Content',
                style: AppTextStyles.w700.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultFormField(
                      controller: titleController,
                      hintText: "Title",
                      title: "Title",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Title';
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
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Author Profile",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownInput<String>(
                name: "Author's Full Name",
                label: "Author's Full Name",
                leadingIcon: Iconsax.user,
                leadingIconColor: ColorConstant.primaryColor,
                items: controller.authors.map((element) => DropdownMenuItem(
                  value: element.id,
                  child: Text('${element.firstName} ${element.lastName}'),
                )).toList(),
                validator: (value) {
                  authorController.text = value!;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectStartTime(context),
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
                      onTap: () => _selectEndTime(context),
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: "End Time",
                        title: 'End Time',
                        prefixIcon: Icons.timer_off_outlined,
                        readOnly: true,
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectStartDate(context),
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: "Start Date",
                        title: 'Start Date',
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
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,

    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  return picked;
}
class UpdatePaperDialog extends GetWidget<OrganizerUpdateProjectController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController hallController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        firstDate: controller.startDate.value!,
        initialDate: DateTime.tryParse(startDateController.text)??controller.startDate.value!,
        lastDate: controller.endDate.value!,);
    if (picked != null) {
      startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await selectDate(context);
    if (picked != null) {
      endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      startTimeController.text = picked.format(context);
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      endTimeController.text = picked.format(context);
    }
  }

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
                    'Paper Session',
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
                          PaperModel pp = PaperModel(
                            startDate: startDateController.text,
                            language: languageController.text,
                            id: controller.paperModel.length.toString(),
                            hall: hallController.text,
                            endDate: endDateController.text,
                            authorProfile: authorController.text,
                            title: titleController.text,
                          );
                          controller.paperModel.add(pp);
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
              Text(
                'Paper Content',
                style: AppTextStyles.w700.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultFormField(
                      controller: titleController,
                      hintText: "Title",
                      title: "Title",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Title';
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
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Author Profile",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownInput<String>(
                name: "Author's Full Name",
                label: "Author's Full Name",
                leadingIcon: Iconsax.user,
                leadingIconColor: ColorConstant.primaryColor,
                items: controller.authors.map((element) => DropdownMenuItem(
                  value: element.id,
                  child: Text('${element.firstName} ${element.lastName}'),
                )).toList(),
                validator: (value) {
                  authorController.text = value!;
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectStartTime(context),
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
                      onTap: () => _selectEndTime(context),
                      child: DefaultFormField(
                        controller: endTimeController,
                        labelText: "End Time",
                        title: 'End Time',
                        prefixIcon: Icons.timer_off_outlined,
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
                      onTap: () => _selectStartDate(context),
                      child: DefaultFormField(
                        controller: startDateController,
                        labelText: "Start Date",
                        title: 'Start Date',
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
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.tryParse(endDateController.text) ??controller.startDate.value!,
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
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
