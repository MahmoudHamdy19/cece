

import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/conference_data_row.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/presentation/programmer/show_all_projects/controller/show_all_projects_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_network/image_network.dart';


class ContenetDetailsView extends GetWidget<ShowAllProjectsController> {
  OrganizerEvents conference = Get.arguments ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      SizedBox(width: 10.0,),
                      Row(
                        children: [
                          Text(
                            conference.user?.name??'',
                            style: AppTextStyles.w700.copyWith(fontSize: 20),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: statusColor[conference.status]
                            ) ,
                            child: Text(
                              status[conference.status],
                              style: AppTextStyles.w700.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Visibility(
                        visible: conference.status == 0,
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                iconColor: Colors.white,
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () {
                                showConfirmDialog('Are you sure ?','Are you sure you want to reject this conference', () {
                                  Get.back();
                                  Get.back();
                                  controller.rejectConference(conference) ;
                                });
                              },
                              icon: const Icon(
                                Icons.block,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Reject",
                                style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                iconColor: Colors.white,
                                backgroundColor: ColorConstant.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () {
                                showConfirmDialog('Are you sure ?','Are you sure you want to accept this conference', () {
                                  Get.back();
                                  Get.back();
                                  controller.acceptConference(conference) ;
                                });
                              },
                              icon: const Icon(
                                Iconsax.add,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Accept",
                                style:
                                    Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Colors.white,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    conference.registrationCeremony?.startDate??'' +
                        " : " +
                        conference.registrationCeremony!.startTime,
                    style: AppTextStyles.w300.copyWith(
                        fontSize: 16, color: ColorConstant.mediumGrey, height: 0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "Name App : ",
                        style: AppTextStyles.w700.copyWith(fontSize: 18),
                      ),
                      TextSpan(
                        text: conference.conferenceDetails?.conferenceName??'',
                        style: AppTextStyles.w700.copyWith(
                            fontSize: 16, color: ColorConstant.primaryColor),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "Details : ",
                        style: AppTextStyles.w700.copyWith(fontSize: 18),
                      ),
                      TextSpan(
                        text:
                           conference.conferenceDetails?.conferenceDescription??"",
                        style: AppTextStyles.w700.copyWith(
                            fontSize: 16, color: ColorConstant.primaryColor),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "App Color : ",
                        style: AppTextStyles.w700.copyWith(fontSize: 18),
                      ),
                      TextSpan(
                        text:conference.conferenceDetails?.color,
                        style: AppTextStyles.w700.copyWith(
                            fontSize: 16, color: ColorConstant.primaryColor),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "App Text Family : ",
                        style: AppTextStyles.w700.copyWith(fontSize: 18),
                      ),
                      TextSpan(
                        text: conference.conferenceDetails?.fontName,
                        style: AppTextStyles.w700.copyWith(
                            fontSize: 16, color: ColorConstant.primaryColor),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Image Logo :",
                        style: AppTextStyles.w700.copyWith(fontSize: 20),
                      ),
                      Visibility(
                        visible: conference.conferenceDetails?.image != null,
                        child: SizedBox(
                          height: 250,
                          child: Center(
                            child: ClipRRect(
                              child:ImageNetwork(
                                image: conference.conferenceDetails!.image!,
                                height: 200,
                                width: 200,
                                duration: 1500,
                                curve: Curves.easeIn,
                                onPointer: true,
                                debugPrint: false,
                                fullScreen: false,
                                fitAndroidIos: BoxFit.cover,
                                fitWeb: BoxFitWeb.cover,
                                borderRadius: BorderRadius.circular(70),
                                onLoading: const CircularProgressIndicator(
                                  color: Colors.indigoAccent,
                                ),
                                onError: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  debugPrint("©gabriel_patrick_souza");
                                },
                              ),
                            ),

                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Registration Ceremony :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                    child:DataTable(
                      columnSpacing: 5,
                      dividerThickness: 1.2,
                      dataTextStyle: const TextStyle(
                          fontSize: 12, fontFamily: "Cairo"),
                      columns: const [

                        DataColumn(
                          label: Text(
                            "Hall",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Date",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ],
                      rows: List.generate(
                        1,
                            (index) => DataRow(
                          cells: [

                            buildCell(Icons.title_outlined,conference.registrationCeremony?.hall??''),
                            buildCell(Icons.date_range,
                                "${conference.registrationCeremony?.startDate} ${conference.registrationCeremony?.startTime}"),

                          ],
                        ),
                      ),
                    ) ,
                  ),
                  Text(
                    "Closing Ceremony :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child:  DataTable(
                       columnSpacing: 5,
                       dividerThickness: 1.2,
                       dataTextStyle: const TextStyle(
                           fontSize: 12, fontFamily: "Cairo"),
                       columns: const [

                         DataColumn(
                           label: Text(
                             "Hall",
                             overflow: TextOverflow.ellipsis,
                           ),
                         ),
                         DataColumn(
                           label: Text(
                             "Date",
                             overflow: TextOverflow.ellipsis,
                           ),
                         ),

                       ],
                       rows: List.generate(
                         1,
                             (index) => DataRow(
                           cells: [

                             buildCell(Icons.title_outlined,conference.closingCeremony?.hall??''),
                             buildCell(Icons.date_range,
                                 "${conference.closingCeremony?.startDate} ${conference.closingCeremony?.startTime}"),


                           ],
                         ),
                       ),
                     ),
                  ),
                  Text(
                    "Exhibition Details :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(

                    scrollDirection: Axis.horizontal,
                   child:  DataTable(
                     columnSpacing: 5,
                     dividerThickness: 1.2,
                     dataTextStyle: const TextStyle(
                         fontSize: 12, fontFamily: "Cairo"),
                     columns: const [
                       DataColumn(
                         label: Text(
                           "Exhibition Name",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       DataColumn(
                         label: Text(
                           "Company",
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
                           "Date",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       DataColumn(
                         label: Text(
                           "End Date",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),

                     ],
                     rows: List.generate(
                       1,
                           (index) => DataRow(
                         cells: [
                           buildCell(Icons.title_outlined, conference.exhibitionCeremony?.exhibitionName??''),
                           buildCell(Icons.title_outlined, conference.exhibitionCeremony?.companyName.toString()??''),
                           buildCell(Icons.title_outlined, conference.exhibitionCeremony?.hall??''),
                           buildCell(Icons.date_range,
                               "${ conference.exhibitionCeremony?.startDate??''} ${ conference.exhibitionCeremony?.startTime??''}"),
                           buildCell(
                               Icons.date_range, "${ conference.exhibitionCeremony?.endDate??''} ${ conference.exhibitionCeremony?.endTime??''}"),
                         ],
                       ),
                     ),
                   ),
                  ),

                  Text(
                    "Workshop Details :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                   child:  DataTable(
                     columnSpacing: 5,
                     dividerThickness: 1.2,
                     dataTextStyle: const TextStyle(
                         fontSize: 12, fontFamily: "Cairo"),
                     columns: const [
                       DataColumn(
                         label: Text(
                           "Topic",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       DataColumn(
                         label: Text(
                           "Presenter Profile",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                       DataColumn(
                         label: Text(
                           "Language",
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),  DataColumn(
                         label: Text(
                           "Hall",
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

                     ],
                     rows: List.generate(
                       conference.workshopList?.length??0,
                           (index) => DataRow(
                         cells: [
                           buildCell(Icons.title_outlined, conference.workshopList?[0].topic??''),
                           buildCell(Icons.title_outlined,conference.presenters?[int.parse(conference.workshopList?[index].presenter??'0')].firstName??''),
                           buildCell(Icons.title_outlined, conference.workshopList?[0].language??''),
                           buildCell(Icons.title_outlined,conference.workshopList?[0].hall??''),

                           buildCell(Icons.date_range,
                               "${conference.workshopList?[0].startDate} ${conference.workshopList?[0].startTime}"),
                           buildCell(
                               Icons.date_range, "${conference.workshopList?[0].endDate} ${conference.workshopList?[0].endTime}"),
                         ],
                       ),
                     ),
                   ),
                  ),
                  Text(
                    "Paper Session :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                    child:  DataTable(
                      columnSpacing: 5,
                      dividerThickness: 1.2,
                      dataTextStyle:
                      const TextStyle(fontSize: 12, fontFamily: "Cairo"),
                      columns: const [
                        DataColumn(
                          label: Text(
                            "Title",
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
                            "Author Profile",
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


                      ],
                      rows: List.generate(
                        conference.paperContentList?.length??0,
                            (index) =>  DataRow(
                          cells: [
                            buildCell(Icons.title_outlined, conference.paperContentList?[index].title??''),
                            buildCell(Icons.title_outlined, conference.paperContentList?[index].language??''),
                            buildCell(Icons.title_outlined,conference.authors?[int.parse(conference.paperContentList?[index].authorProfile??'0')].firstName??''),
                            buildCell(Icons.title_outlined, conference.paperContentList?[index].hall??''),
                            buildCell(Icons.date_range,
                                "${conference.paperContentList?[index].startDate}"),
                            buildCell(
                                Icons.date_range, "${conference.paperContentList?[index].endDate}"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Text(
                    "Panel Discussions Details :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(

                    scrollDirection: Axis.horizontal,
                  child:  DataTable(
                    columnSpacing: 5,
                    dividerThickness: 1.2,
                    dataTextStyle:
                    const TextStyle(fontSize: 12, fontFamily: "Cairo"),
                    columns: const [
                      DataColumn(
                        label: Text(
                          "Topic",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Moderator Profile",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Participants Profile",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),         DataColumn(
                        label: Text(
                          "Hall",
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

                    ],
                    rows: List.generate(
                      conference.panelList?.length??0,
                          (index) => DataRow(
                        cells: [
                          buildCell(Icons.title_outlined,conference.panelList?[index].topic??''),
                          buildCell(Icons.title_outlined,conference.moderators?[int.parse(conference.panelList?[index].moderatorProfile??'0')].firstName??''),
                          buildCell(Icons.title_outlined,conference.participants?[int.parse(conference.panelList?[index].participantProfile??'0')].firstName??''),
                          buildCell(Icons.title_outlined,conference.panelList?[index].hall??''),
                          buildCell(Icons.date_range,
                              "${conference.panelList?[index].startDate}"),
                          buildCell(
                              Icons.date_range, "${conference.panelList?[index].endDate??''}"),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Text(
                    "Keynote Speaker Details :",
                    style: AppTextStyles.w700.copyWith(fontSize: 18),
                  ),
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                   child:  DataTable(
                     columnSpacing: 5,
                     dividerThickness: 1.2,
                     dataTextStyle:
                     const TextStyle(fontSize: 12, fontFamily: "Cairo"),
                     columns: const [
                       DataColumn(
                         label: Text(
                           "Speaker Profile",
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
                       ),  DataColumn(
                         label: Text(
                           "Hall",
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

                     ],
                     rows: List.generate(
                       conference.keynoteSpeakerList?.length??0,
                           (index) => DataRow(
                         cells: [
                           buildCell(Icons.title_outlined,conference.speakers?[int.parse(conference.keynoteSpeakerList?[index].speakerName??'0')].firstName??''),

                           buildCell(Icons.title_outlined,conference.keynoteSpeakerList?[index].topicName??''),
                           buildCell(Icons.title_outlined,conference.keynoteSpeakerList?[index].language??""),
                           buildCell(Icons.title_outlined,conference.keynoteSpeakerList?[index].hall??''),

                           buildCell(Icons.date_range,
                               "${conference.keynoteSpeakerList?[index].startDate} ${conference.keynoteSpeakerList?[index].startTime}"),
                           buildCell(
                               Icons.date_range, "${conference.keynoteSpeakerList?[index].endDate} ${conference.keynoteSpeakerList?[index].endTime}"),
                         ],
                       ),
                     ),
                   ),
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
