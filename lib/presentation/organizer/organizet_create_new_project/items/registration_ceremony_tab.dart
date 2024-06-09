import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/conference_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/components/default_form_faild.dart';

class RegistrationCeremonyContent extends GetWidget<OrganizerCreateNewProjectController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for form fields


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
             createNewProjectTabs(controller,context,'Registration Ceremony'),
            const SizedBox(
              height: 16,
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
                       controller.registrationStartTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.registrationStartTimeController,
                      labelText: "Start Time",
                      title: 'Start Time',
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
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null)
                        controller.registrationEndTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.registrationEndTimeController,
                      labelText: "End Time",
                      title: 'End Time',
                      enabled: false,
                      prefixIcon: Icons.timer_outlined,
                      readOnly: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.tryParse( controller.registrationStartDateController.text)??controller.startDate.value,
                        firstDate: controller.startDate.value!,
                        lastDate: controller.endDate.value!,
                      );
                      if (picked != null)
                        controller.registrationStartDateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                    },
                    child: DefaultFormField(
                      controller: controller.registrationStartDateController,
                      labelText: "Date",
                      title: 'Date',
                      prefixIcon: Icons.date_range_outlined,
                      readOnly: true,
                      enabled: false,
                    ),
                  ),
                ),
              /*  const SizedBox(
                  width: 66,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null)
                        controller.registrationEndDateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                    },
                    child: DefaultFormField(
                      controller: controller.registrationEndDateController,
                      labelText: "endDate",
                      title: 'End Date',
                      prefixIcon: Icons.date_range_outlined,
                      enabled: false,
                      readOnly: true,
                    ),
                  ),
                ),*/
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultFormField(
              controller: controller.registrationHallController,
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
    );
  }
}
