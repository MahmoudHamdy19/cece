import 'package:cece/core/app_export.dart';
 import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_update_project/items/conference_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/components/default_form_faild.dart';


class ClosingCeremonyContent extends GetWidget<OrganizerUpdateProjectController>{
  ClosingCeremonyContent({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            updateProjectTabs(controller, context, 'Closing Ceremony'),

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
                       controller.closingStartTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.closingStartTimeController,
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
                        controller.closingEndTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.closingEndTimeController,
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
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.tryParse(controller.closingStartDateController.text)??controller.startDate.value!,
                        firstDate:controller.startDate.value!,
                        lastDate:controller.endDate.value!,
                      );
                      if (picked != null)
                        controller.closingStartDateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                    },
                    child: DefaultFormField(
                      controller:controller.closingStartDateController,
                      labelText: "Date",
                      title: 'Date',
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
              controller: controller.closingHallController,
              hintText: "Enter Hall",
              labelText: "Hall",
              title: "Hall",
              prefixIcon: Icons.location_city_outlined,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Hall';
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
