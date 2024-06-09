
  import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/app_style.dart';
import '../../../../Core/Utils/Navigater.dart';
import '../../../Tabs/presentaion/manger/tabs_controller.dart';
import '../widgets/Containe_Home.dart';
import 'manger/ContainerModel.dart';





class ActivitiesScreen extends StatefulWidget {
  OrganizerEvents? conference ;

  ActivitiesScreen(this.conference);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 50, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Activities",
                    style: AppTextStyles.bold
                        .copyWith(fontSize: 20, height: 0),
                  ),
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 40,
                      childAspectRatio: 1,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        containerModel(widget.conference).length,
                            (index) => ContainerHomeFeatures(
                          image: containerModel(widget.conference)[index].image,
                          title: containerModel(widget.conference)[index].title,
                          ontap: () {
                            navigateTo(context,
                                containerModel(widget.conference)[index].ontap);
                          },
                          color:ColorConstant.fromHex(widget.conference?.conferenceDetails?.color??'#000000'),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


