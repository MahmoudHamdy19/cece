import 'dart:typed_data';

import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../../../../../core/app_export.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../widgets/custom_date.dart';

class ExhibitionDetails extends StatelessWidget {
  OrganizerEvents? conference ;

  ExhibitionDetails(this.conference);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(
           'Exhibition Details',
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
              text: conference?.conferenceDetails?.conferenceName??'',
              style: AppTextStyles.w600
                  .copyWith(fontSize: 20, color: AppColors.black),
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor
                        ),
                        child: Row(
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.title_sharp,color: Colors.white,),
                              const SizedBox(width: 10,),
                              const Text('Name : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                              const SizedBox(width: 10,),
                              Text(conference?.exhibitionCeremony?.exhibitionName??'',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                            ]
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomWidgetDisplay(
                        icon: Icon(Icons.work_outline),
                        label: "Company Name",
                        date:  conference?.exhibitionCeremony?.companyName.toString()??""
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomWidgetDisplay(label: "From", date:  conference?.exhibitionCeremony?.startDate??''),
                    const SizedBox(height: 10),
                    CustomWidgetDisplay(label: "To", date:  conference?.exhibitionCeremony?.endDate??''),
                    const SizedBox(height: 10),
                    CustomWidgetDisplay(
                        icon: const Icon(Icons.location_on_outlined),
                        label: "Workshop Hall",
                        date:conference?.exhibitionCeremony?.hall??''
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
