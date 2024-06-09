import 'dart:typed_data';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../../../../../core/app_export.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../widgets/custom_date.dart';

class KeynoteSpeakerDetails extends StatelessWidget {
  OrganizerEvents? conference ;

  KeynoteSpeakerDetails(this.conference);


  @override
  Widget build(BuildContext context) {
    var activities = conference?.keynoteSpeakerList;
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(
          'Keynote Speaker Details',
          style: AppTextStyles.w600
              .copyWith(fontSize: 20, color: AppColors.mediumGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: conference?.conferenceDetails?.image == null,
              child: Image.memory(
                conference?.conferenceDetails?.imageFile?? Uint8List(0),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200.0,
              ),
            ),
            Visibility(
              visible:  conference?.conferenceDetails?.image != null,
              child: SizedBox(
                height: 250,
                child: Center(
                  child: ClipRRect(
                    child:ImageNetwork(
                      image:  conference?.conferenceDetails?.image??'',
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
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: conference?.conferenceDetails?.conferenceName ?? '',
              style: AppTextStyles.w600
                  .copyWith(fontSize: 20, color: AppColors.black),
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              itemCount: activities?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.topic, color: Colors.white,),
                              const SizedBox(width: 10,),
                              const Text('Topic : ', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                              const SizedBox(width: 10,),
                              Text(activities?[index].topicName ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomWidgetDisplay(
                          icon: const Icon(Icons.person),
                          label: "Speaker Profile",
                          date: conference?.speakers?[int.parse(activities?[index].speakerName??'0')].firstName ?? '',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomWidgetDisplay(
                          icon: const Icon(Icons.language),
                          label: "Language",
                          date:  activities?[index].language ?? '',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomWidgetDisplay(label: "From", date:  activities?[index].startDate ?? ''),
                        const SizedBox(height: 10),
                        CustomWidgetDisplay(label: "To", date: activities?[index].endDate ?? ''),
                        const SizedBox(height: 10),
                        CustomWidgetDisplay(
                          icon: const Icon(Icons.location_on),
                          label: "Hall",
                          date:  activities?[index].hall ?? '',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
