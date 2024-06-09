import 'dart:typed_data';
import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_update_project/items/conference_details_item.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_network/image_network.dart';
import '../../../../core/utils/components/default_form_faild.dart';
import '../../../../core/utils/components/picture_source_button.dart';
import '../controller/organizer_update_project_controller.dart';

class ConferenceWidget extends GetWidget<OrganizerUpdateProjectController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            updateProjectTabs(controller, context, 'Conference Style'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose Font",
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 55.0,
                        child: Obx(
                          ()=> DropdownButtonFormField<String>(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            style:TextStyle(
                                color: Colors.black, fontSize: 12),
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'select any font';
                              }
                              return null ;
                            },
                            value: controller.fontController.value,
                            items: fontListMap.keys.map((e) =>DropdownMenuItem<String>(
                              value: e,
                                child: Text(e))).toList(),

                            onChanged: (value) {
                              print(value) ;
                              controller.fontController.value = value??'';
                            },
                            decoration: InputDecoration(
                              prefix: Icon(Iconsax.text,color: ColorConstant.primaryColor,),
                              labelStyle:   TextStyle(
                                  color: ColorConstant.darkGrey, fontSize: 15),
                              hintStyle:
                              TextStyle(color: ColorConstant.mediumGrey, fontSize: 12),
                              focusedBorder:OutlineInputBorder(
                                borderSide:  BorderSide(color:ColorConstant.primaryColor,width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:ColorConstant.primaryColor,width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(color:ColorConstant.lightGrey,width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:ColorConstant.primaryColor,width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose Color",
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap:  () async {
                          final Color newColor = await showColorPickerDialog(
                            context,
                            Colors.red,
                            title: Text('ColorPicker',
                                style: Theme.of(context).textTheme.titleLarge),
                            width: 40,
                            height: 40,
                            spacing: 0,
                            runSpacing: 0,
                            borderRadius: 0,
                            wheelDiameter: 165,
                            enableOpacity: true,
                            showColorCode: true,
                            colorCodeHasColor: true,
                            pickersEnabled: <ColorPickerType, bool>{
                              ColorPickerType.wheel: true,
                              ColorPickerType.accent: false,
                              ColorPickerType.primary: false,
                            },
                            copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                              copyButton: true,
                              pasteButton: true,
                              longPressMenu: true,
                            ),
                            actionButtons: const ColorPickerActionButtons(
                              okButton: true,
                              closeButton: true,
                              dialogActionButtons: false,
                            ),
                            constraints: const BoxConstraints(
                                minHeight: 480, minWidth: 320, maxWidth: 400),
                          );
                          controller.colorController.text = colorToHex(newColor);
                        },
                        child: DefaultFormField(
                          controller:  controller.colorController,
                          hintText: "Choose Color",
                          prefixIcon: Iconsax.colorfilter,
                          readOnly: false,
                          enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Choose Color';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Center(
                child: Text(
                  'Background image must be of size 1920 x 1080 pixels and in PNG or JPG format',
                ),
              ),
            ),
            PictureSourceButton(
              icon: Iconsax.camera,
              label: 'Upload / Background image',
              onTap: () => controller.pickConferenceBackgroundImage(),
            ),
            const SizedBox(height: 15),
            Obx(
                  () => Visibility(
                visible: controller.conferenceBackgroundImageUint8List.value != null,
                child: SizedBox(
                  height: 250,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(controller.conferenceBackgroundImageUint8List.value ?? Uint8List(0)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,) ,
            Text('Old Image', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,) ,
            Visibility(
              visible: controller.conference.conferenceDetails?.backgroundImage != null,
              child: SizedBox(
                height: 250,
                child: Center(
                  child: ClipRRect(
                    child:ImageNetwork(
                      image: controller.conference.conferenceDetails!.backgroundImage!,
                      height: 250,
                      width: 250,
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
      ),
    );
  }

  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }
}
