  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../theme/app_style.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../../data/conference_model.dart';
import '../widgets/custom_Image.dart';
import '../widgets/custom_date.dart';

class ActivityDetailsView extends StatefulWidget {
  const ActivityDetailsView({required this.AppTitle});
final String AppTitle;
  @override
  State<ActivityDetailsView> createState() => _ActivityDetailsViewState();
}

class _ActivityDetailsViewState extends State<ActivityDetailsView> {
  List<Conference> activities = [
    Conference(
      imageUrl: "assets/images/img.png",
      title: "Registration Ceremony",
      subtitle: "Register for the conference and get ready to embark on a journey of knowledge and innovation.",
      fromDate: "June 14, 2024, 10:00 AM",
      toDate: "June 14, 2024, 12:00 PM",
      location: "Riyadh, Saudi Arabia",
      registrationLocation: "Conference Hall A",
        companyName: "Company Name Test",
        exhibitionName: "exhibition Name Test"
        ,exhibitionLocation: "Riyadh, Saudi Arabia",
        workshopTopic: "work shopTopic"
        ,workshopLanguage: "Arabic",
        workshopHall: "work shopHall",
        workshopPresenterProfile: "workshop Presenter Profile",
      paperTitle: "paper Title",
      paperProfile: "paper Profile",
      paperLanguage: "Arabic",
        paperHall: "paper Hall",
        PanelTopic: "Panel Topic",
        PanelModeratorProfile:  "Panel Moderator Profile",
        PanelParticipantsProfil: "Panel Participants Profile",
        PanelHall: "Panel Hall",
keynoteLanguage:"keynote Language" ,
      keynotePresenterProfile: "keynote Presenter Profile",
      keynoteHall: "keynote Hall",
      keynoteSpeakerName: "keynote Speaker Name",
      keynoteTopic:"keynote Topic" ,



    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(
          widget.AppTitle,
          style: AppTextStyles.w600
              .copyWith(fontSize: 20, color: AppColors.mediumGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageContainer(
              activityTitle: widget.AppTitle.toString(),
              imageUrl:  activities[0].imageUrl,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: "Artificial Intelligence Conference 2024",
              style: AppTextStyles.w600
                  .copyWith(fontSize: 20, color: AppColors.black),
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            if ( widget.AppTitle.toString() == "Exhibition Details") ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: double.infinity,
                          decoration:   BoxDecoration(
                              color: AppColors.primaryColor
                          ),
                          child:Row(
                              children: [
                                const SizedBox(width: 10,),
                                const Icon(Icons.title_sharp,color: Colors.white,),
                                const SizedBox(width: 10,),
                                const Text('Name : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                const SizedBox(width: 10,),
                                Text(activities[0].exhibitionName!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                              ]
                          )
                      ),
                      const SizedBox(
                        height: 10,
                      ),      CustomWidgetDisplay(
                        icon: Icon(Icons.work_outline),
                          label: "Company Name", date:  activities[0].companyName!),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomWidgetDisplay(label: "From", date:  activities[0].fromDate),
                      const SizedBox(height: 10),
                      CustomWidgetDisplay(label: "To", date:  activities[0].toDate),
                      const SizedBox(height: 10),
                       CustomWidgetDisplay(
                          icon: const Icon(Icons.location_on_outlined),
                          label: "Workshop Hall", date: activities[0].exhibitionLocation!),
                    ],
                  ),
                ),
              )
            ],
            if ( widget.AppTitle.toString() == "Workshop Details") ...[
              ListView.builder(
                itemCount: 3,
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
                          decoration:   BoxDecoration(
                            color: AppColors.primaryColor
                          ),
                          child:Row(
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.topic,color: Colors.white,),
                              const SizedBox(width: 10,),
                              const Text('Topic : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                              const SizedBox(width: 10,),
                              Text(activities[0].workshopTopic!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                 
                            ]
                          )
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomWidgetDisplay(
                        icon: const Icon(Icons.language),
                          label: "Language",
                          date:  activities[0].workshopLanguage!),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomWidgetDisplay(
                        icon: const Icon(Icons.person),
                          label: "Presenter Profile",
                          date:  activities[0].workshopPresenterProfile!),
                      const SizedBox(
                        height: 10,
                      ),
                        CustomWidgetDisplay(label: "From", date:  activities[0].fromDate),
                        const SizedBox(height: 10),
                        CustomWidgetDisplay(label: "To", date:  activities[0].toDate),
                        const SizedBox(height: 10),
                      CustomWidgetDisplay(
                        icon: const Icon(Icons.location_on_outlined),
                          label: "Workshop Hall", date:  activities[0].workshopHall!),],),
                 ),
               );
              },)
        
            ],
            if ( widget.AppTitle.toString() == "Paper Session") ...[
              ListView.builder(
                itemCount: 3,
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
                              decoration:   BoxDecoration(
                                  color: AppColors.primaryColor
                              ),
                              child:Row(
                                  children: [
                                    const SizedBox(width: 10,),
                                    const Icon(Icons.title,color: Colors.white,),
                                    const SizedBox(width: 10,),
                                    const Text('Title : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 10,),
                                    Text(activities[0].paperTitle!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                                  ]
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.language),
                              label: "Language",
                              date:  activities[0].paperLanguage!),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.person),
                              label: "Author Profile",
                              date:  activities[0].paperProfile!),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(label: "From", date:  activities[0].fromDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(label: "To", date:  activities[0].toDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.location_on),
                              label: "Paper Hall", date:  activities[0].paperHall!),],),
                    ),
                  );
                },)
        
            ],
            if ( widget.AppTitle.toString() == "Panel Discussions Details") ...[
              ListView.builder(
                itemCount: 3,
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
                          decoration:   BoxDecoration(
                              color: AppColors.primaryColor
                          ),
                          child:Row(
                              children: [
                                const SizedBox(width: 10,),
                                const Icon(Icons.topic,color: Colors.white,),
                                const SizedBox(width: 10,),
                                const Text('Topic : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                const SizedBox(width: 10,),
                                Text(activities[0].PanelTopic!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                    
                              ]
                          )
                      ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.person),
                              label: "Moderator Profile",
                              date:  activities[0].PanelModeratorProfile!),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                              icon: Icon(Icons.person),
                              label: "Participants Profile",
                              date:  activities[0].PanelParticipantsProfil!),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(label: "From", date:  activities[0].fromDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(label: "To", date:  activities[0].toDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.location_on),
                              label: "Panel Hall", date:  activities[0].PanelHall!),],),
                    ),
                  );
                },
              ),

            ],
            if ( widget.AppTitle.toString() == "Keynote Speaker Details") ...[
              ListView.builder(
                itemCount: 1,
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
                              decoration:   BoxDecoration(
                                  color: AppColors.primaryColor
                              ),
                              child:Row(
                                  children: [
                                    const SizedBox(width: 10,),
                                    const Icon(Icons.topic,color: Colors.white,),
                                    const SizedBox(width: 10,),
                                    const Text('Topic : ',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 10,),
                                    Text(activities[0].keynoteTopic!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),),
                                  ]
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.person),
                              label: "Presenter Profile",
                              date:  activities[0].keynotePresenterProfile!),
                    
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.language),
                              label: "Language",
                              date:  activities[0].keynoteLanguage!),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomWidgetDisplay(label: "From", date:  activities[0].fromDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(label: "To", date:  activities[0].toDate),
                          const SizedBox(height: 10),
                          CustomWidgetDisplay(
                            icon: Icon(Icons.location_on),
                              label: "Hall", date:  activities[0].keynoteHall!),],),
                    ),
                  );
                },
              ),

            ],
          ],
        ),
      ),
    );
  }
}
