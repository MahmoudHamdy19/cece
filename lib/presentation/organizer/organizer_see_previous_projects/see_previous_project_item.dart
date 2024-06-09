
import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizer_see_previous_projects/controller/organizer_see_previous_projects_controller.dart';
 import 'package:flutter/material.dart';

class SeePreviousProjectItem extends GetWidget<OrganizerSeePreviousProjectsController>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(
        ()=> DataTable(
          columnSpacing: 5,
          dividerThickness: 1.2,
          headingTextStyle:   const TextStyle(
            fontSize:
            14,
            fontWeight: FontWeight.bold,
            fontFamily:
            "Cairo" ,
          ),
          dataTextStyle:
          const TextStyle(
              fontSize:
              12,
              fontFamily:
              "Cairo" ,
          ),
          columns: const [
            DataColumn(
              label: Text(
                "Conference Name",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                "Status",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                "Start Date",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                "End Date",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                "Edit Conference",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                "Conference Code",
                overflow:
                TextOverflow
                    .ellipsis,
              ),
            ),
          ], rows:controller.conferences.map((element) => DataRow(cells: [
            DataCell(Text(element.conferenceDetails?.conferenceName??'')),
            DataCell(Text(status[element.status])),
            DataCell(Text(element.conferenceDetails?.startDate??'')),
            DataCell(Text(element.conferenceDetails?.endDate??'')),
            DataCell(ElevatedButton(onPressed: () {
              Get.offAndToNamed(AppRoutes.organizerUpdateProject,arguments: element) ;
            }, child: Text('Edit'),),),
          DataCell(Text(element.code??'Waiting ...')),
        ])).toList(),
        ),
      ),
    ); 
  }
}
