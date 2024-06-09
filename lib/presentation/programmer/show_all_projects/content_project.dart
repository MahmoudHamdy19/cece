
import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/programmer/show_all_projects/controller/show_all_projects_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';

class ContentProject extends GetWidget<ShowAllProjectsController> {
  int index ;

  ContentProject(this.index);

  @override
  Widget build(BuildContext context) {
    var conference = controller.conferences[index] ;
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
                          //navigateTo(context, DetailsView());
                          Get.toNamed(AppRoutes.programmerDetailsView,arguments: conference);
                        },
                        icon: const Icon(
                          Iconsax.send_2,
                          color: Colors.white,
                        ),
                        label: Text(
                          "View Details",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.yMEd().format(conference.created!) +
                        " : " +
                        DateFormat.jm().format(conference.created!),
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
                        text: conference.conferenceDetails?.conferenceName,
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
                        text:conference.conferenceDetails?.conferenceDescription,
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
                        text: conference.conferenceDetails?.color,
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
                      SizedBox(
                        width: 20,
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

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
