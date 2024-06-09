import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/programmer_side_menu.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/programmer/coding_stage/codingstage.dart';
import 'package:cece/presentation/programmer/coding_stage/controller/coding_stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class ContentCodingStageItem extends GetWidget<CodingStageController>{
  int index ;
  ContentCodingStageItem(this.index);
  @override
  Widget build(BuildContext context) {
    var conference = controller.conferences[index];
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
                      Text(
                        controller.conferences[index].user?.name??"",
                        style: AppTextStyles.w700.copyWith(fontSize: 20),
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
                        onPressed: () async {
                          await showInformationDialog(context,
                            Container(),() {
                              conference.code  = math.Random().nextInt(1000).toString();
                              controller.doneConference(conference);

                            },);
                        },
                        icon: Icon(
                          Iconsax.check,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Done",
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
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
                        text: controller.conferences[index].conferenceDetails?.conferenceName??'',
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
                        text:  controller.conferences[index].conferenceDetails?.conferenceDescription,
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
                        text:  controller.conferences[index].conferenceDetails?.color,
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
                        text:  controller.conferences[index].conferenceDetails?.fontName,
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
                        visible:conference.conferenceDetails?.image != null,
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
    );}
}



final TextEditingController _textEditingController = TextEditingController();
var _formKey = GlobalKey<FormState>();
Future<void> showInformationDialog(BuildContext context,Widget widget , void Function()? onPressed) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              ],
            ),
            title: Text('Are you sure you want to Create this Conference?'),
            actions: <Widget>[
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  iconColor: Colors.white,
                  backgroundColor: ColorConstant.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed:onPressed,
                icon:  Icon(
                  Iconsax.send1,
                  color: Colors.white,
                ),
                label: Text(
                  "Yes",
                  style:
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
      });
}


  class ContentCodingStage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
        drawer: ProgrammerSideMenu(1),
        backgroundColor: ColorConstant.kBgLightColor,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !isDesktop(context)
                ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: Builder(
                          builder: (context) {
                            return const Icon(Icons.menu);
                          }
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),
              ],
            )
                : Expanded(
              flex: size.width > 1340 ? 2 : 3,
              child:  ProgrammerSideMenu(1),
            ),
            Expanded(
                flex: 10,
                child: CodingStageView()
            ),
          ],
        ),
      );
    }
  }