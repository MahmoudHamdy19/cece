import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/add_keynote_dialog.dart';
import 'package:cece/data/models/collaborator_model.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_update_project/items/conference_details_item.dart';
import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/components/update_collaborator_dialog.dart';



class KeynoteSpeakerContent extends GetWidget<OrganizerUpdateProjectController> {
    @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(UpdateKeynoteDialog());
        },
        child: Icon(Icons.add),
      ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            updateProjectTabs(controller, context, 'Keynote Speaker'),

            Obx(
              ()=> SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 5,
                  dividerThickness: 1.2,
                  dataTextStyle:
                  const TextStyle(fontSize: 12, fontFamily: "Cairo"),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Speaker's Full Name",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Topic Name",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Language",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Start Date",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "End Date",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Hall",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Delete",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  rows: controller.keynoteModel.map((element) {
                    var collaborator = controller.speakers.firstWhere((e) =>e.id==element.speakerName,orElse: () => CollaboratorModel(),);
                    return DataRow(cells: [
                    DataCell(Text('${collaborator.firstName} ${collaborator.lastName}')),
                       DataCell(Visibility(
                         visible: collaborator.id!=null ,
                         child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              Get.dialog(
                                UpdateCollaboratorDialog(title: 'Update Speaker',collaborator:collaborator,onPressed: (value) {
                                  controller.speakers[int.parse(element.id.toString())] = value ;
                                },),) ;
                            }, icon: Icon(Iconsax.personalcard)),
                            Text('${collaborator.firstName} ${collaborator.lastName}'??''),
                          ],
                                             ),
                       )),
                    DataCell(Text(element.language??'')),
                    DataCell(Text(element.startDate??'')),
                    DataCell(Text(element.endDate??'')),
                    DataCell(Text(element.hall??'')),
                      DataCell(ElevatedButton(onPressed: (){
                        controller.keynoteModel.removeWhere((e) => e.id == element.id);
                      }, child: Text('Delete'),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),),
                  ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
