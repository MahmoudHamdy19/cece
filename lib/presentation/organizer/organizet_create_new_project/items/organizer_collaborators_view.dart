import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/add_collaborator_dialog.dart';
import 'package:cece/core/utils/components/update_collaborator_dialog.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/conference_details_item.dart';
 import 'package:flutter/material.dart';
 import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/components/default_form_faild.dart';

class OrganizerCollaboratorsView extends GetWidget<OrganizerCreateNewProjectController> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   createNewProjectTabs(controller,context,'Add Collaborators'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Presenters',style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                          ()=> controller.presenters.isNotEmpty?Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  for(var i = 0 ; i<controller.presenters.length;i++)
                                  InkWell(
                                    onTap: () {
                                       Get.dialog(
                                         UpdateCollaboratorDialog(title: 'Update Presenter',collaborator:controller.presenters[i],onPressed: (value) {
                                           controller.presenters[i] = value ;
                                         },),) ;
                                    },
                                    child: SizedBox(
                                      width: 200.0,
                                      child: DefaultFormField(
                                        hintText: '${controller.presenters[i].firstName} ${controller.presenters[i].lastName}',
                                        initialValue: '${controller.presenters[i].firstName} ${controller.presenters[i].lastName}',
                                         prefixIcon: Iconsax.personalcard,
                                       enabled: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ):Center(child: Text('No Presenters Found'),),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: ColorConstant.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(AddCollaboratorDialog(title: 'Presenter',onPressed: (value) {
                              //  print(value.toJson());
                                value.id = controller.presenters.length.toString();
                                controller.presenters.add(value);
                              },));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Speakers',style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                              ()=>controller.speakers.isNotEmpty? Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              for(var i = 0 ; i<controller.speakers.length;i++)
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      UpdateCollaboratorDialog(title: 'Update Speaker',collaborator:controller.speakers[i],onPressed: (value) {
                                        controller.speakers[i] = value;
                                      },),) ;
                                  },
                                  child: SizedBox(
                                    width: 200.0,
                                    child: DefaultFormField(
                                      hintText: '${controller.speakers[i].firstName} ${controller.speakers[i].lastName}',
                                      initialValue: '${controller.speakers[i].firstName} ${controller.speakers[i].lastName}',
                                      prefixIcon: Iconsax.personalcard,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                            ],
                          ):Center(child: Text('No Speakers Found'),
                        ),
                      ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: ColorConstant.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(AddCollaboratorDialog(title: 'Speaker',onPressed: (value) {
                                //  print(value.toJson());
                                value.id = controller.speakers.length.toString();

                                controller.speakers.add(value);
                              },));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Authors',style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                              ()=>controller.authors.isNotEmpty? Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              for(var i = 0 ; i<controller.authors.length;i++)
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      UpdateCollaboratorDialog(title: 'Update Author',collaborator: controller.authors[i],onPressed: (value) {
                                        controller.authors[i] = value ;
                                      },),) ;
                                  },
                                  child: SizedBox(
                                    width: 200.0,
                                    child: DefaultFormField(
                                      hintText: '${controller.authors[i].firstName} ${controller.authors[i].lastName}',
                                      initialValue: '${controller.authors[i].firstName} ${controller.authors[i].lastName}',
                                      prefixIcon: Iconsax.personalcard,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                            ],
                          ):Center(child: Text('No Authors Found'),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: ColorConstant.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(AddCollaboratorDialog(title: 'Author',onPressed: (value) {
                                //  print(value.toJson());
                                value.id = controller.authors.length.toString();

                                controller.authors.add(value);
                              },));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                   const SizedBox(
                    height: 25,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Moderators',style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                              ()=>controller.moderators.isNotEmpty? Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              for(var i = 0 ; i<controller.moderators.length;i++)
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      UpdateCollaboratorDialog(title: 'Update Moderator',collaborator:controller.moderators[i] ,onPressed: (value) {
                                        controller.moderators[i] = value;
                                      },),) ;
                                  },
                                  child: SizedBox(
                                    width: 200.0,
                                    child: DefaultFormField(
                                      hintText: '${controller.moderators[i].firstName} ${controller.moderators[i].lastName}',
                                      initialValue: '${controller.moderators[i].firstName} ${controller.moderators[i].lastName}',
                                      prefixIcon: Iconsax.personalcard,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                            ],
                          ):Center(child: Text('No Moderators Found'),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: ColorConstant.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(AddCollaboratorDialog(title: 'Moderator',onPressed: (value) {
                                //  print(value.toJson());
                                value.id = controller.moderators.length.toString();

                                controller.moderators.add(value);
                              },));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                   const SizedBox(
                    height: 25,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Participants',style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Obx(
                              ()=>controller.participants.isNotEmpty? Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              for(var i = 0 ; i<controller.participants.length;i++)
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      UpdateCollaboratorDialog(title: 'Update Participant',collaborator: controller.participants[i],onPressed: (value) {
                                        controller.participants[i] = value;
                                      },),) ;
                                  },
                                  child: SizedBox(
                                    width: 200.0,
                                    child: DefaultFormField(
                                      hintText: '${controller.participants[i].firstName} ${controller.participants[i].lastName}',
                                      initialValue: '${controller.participants[i].firstName} ${controller.participants[i].lastName}',
                                      prefixIcon: Iconsax.personalcard,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                            ],
                          ):Center(child: Text('No Participants Found'),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: ColorConstant.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(AddCollaboratorDialog(title: 'Participant',onPressed: (value) {
                                //  print(value.toJson());
                                value.id = controller.participants.length.toString();

                                controller.participants.add(value);
                              },));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                 ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
