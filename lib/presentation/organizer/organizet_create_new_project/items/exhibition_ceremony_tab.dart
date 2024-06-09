import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/conference_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/components/default_form_faild.dart';


class ExhibitionDetails extends GetWidget<OrganizerCreateNewProjectController>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            createNewProjectTabs(controller,context,'Exhibition Details'),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DefaultFormField(
                    controller: controller.exhibitionNameController,
                    hintText: "Exhibition Name",
                    prefixIcon: Icons.confirmation_num_outlined,
                    title: "Exhibition Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Exhibition Name';
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
                    controller: controller.exhibitionCompanyNameController,
                    hintText: "Company Name",
                    prefixIcon: Icons.business_sharp,
                    title: "Company Name",
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstant.primaryColor,
                  child: InkWell(
                    onTap: () {
                      if(controller.exhibitionCompanyNameController.text.isNotEmpty){
                        controller.exhibitionCompanysName.add(controller.exhibitionCompanyNameController.text);
                        controller.exhibitionCompanyNameController.clear();
                      }
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstant.primaryColor,
                  child: InkWell(
                    onTap: () {
                     Get.defaultDialog(
                       title: 'Companies',
                       content: SizedBox(
                         width: 200
                         ,
                         height: 150,
                         child: Obx(
                             ()=> ListView.builder(
                             itemCount: controller.exhibitionCompanysName.length,
                             shrinkWrap: true,
                             itemBuilder: (context, index) {
                               return ListTile(
                                 title: Text(controller.exhibitionCompanysName[index]),
                                 trailing: Icon(Icons.delete,color: Colors.red,),
                                 onTap: () {
                                   controller.exhibitionCompanysName.removeAt(index);
                                 },
                               );
                             }
                           ),
                         ),
                       )
                     );
                    },
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
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
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null)
                        controller.exhibitionStartTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.exhibitionStartTimeController,
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
                        controller.exhibitionEndTimeController.text = picked.format(context);
                    },
                    child: DefaultFormField(
                      controller: controller.exhibitionEndTimeController,
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
                        initialDate: DateTime.tryParse(controller.exhibitionStartDateController.text)??controller.startDate.value,
                        firstDate: controller.startDate.value!,
                        lastDate:controller.endDate.value!,
                      );
                      if (picked != null)
                        controller.exhibitionStartDateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                    },
                    child: DefaultFormField(
                      controller:controller.exhibitionStartDateController,
                      labelText: "Start Date",
                      title: 'Start Date',
                      prefixIcon: Icons.date_range_outlined,
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
                         firstDate:firstDateEndCheck(controller.exhibitionStartDateController), 
                        lastDate: controller.endDate.value!,
                      );
                      if (picked != null)
                        controller.exhibitionEndDateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                    },
                    child: DefaultFormField(
                      controller: controller.exhibitionEndDateController,
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
              controller: controller.exhibitionHallController,
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


DateTime firstDateEndCheck(TextEditingController controller)=> DateTime.parse(controller.text).add(Duration(days: 1));