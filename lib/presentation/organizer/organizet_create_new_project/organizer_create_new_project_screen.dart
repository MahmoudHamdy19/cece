
import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/organizer_timeline.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/closing_ceremony_tab.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/conference_details_item.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/conference_widget.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/exhibition_ceremony_tab.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/keynote_speaker_content_tab.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/organizer_collaborators_view.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/panel_content_tab.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/paper_content_tab.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/preview_item.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/items/registration_ceremony_tab.dart';
   import 'package:flutter/material.dart';

import 'items/workshop_ceremony_tab.dart';

class OrganizerCreateNewProject extends GetWidget<OrganizerCreateNewProjectController> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>controller.state.value.getScreenWidget(_body(), (){}));
  }
  _body()=> Column(
    children: [
      SizedBox(
        height: 80.0,
        child: Row(
          children: [
            IconButton(onPressed: () {
              _scrollController.animateTo(_scrollController.offset-150, duration: Duration(milliseconds: 200 ), curve: Curves.linear);
            }, icon: Icon(Icons.arrow_back_ios)),
            Expanded(
              child: Obx(
                    ()=>ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children:
                  [
                    for(int i=0;i<organizerCreateNewProject.length;i++)
                      TimelineItem(
                        index: i, title: organizerCreateNewProject[i], currentTabTagIndex: controller.currentIndex.value, onTap: (p0) {
                        controller.toggleTap(i);
                      },)
                  ],
                ),
              ),
            ),
            IconButton(onPressed: () {
              _scrollController.animateTo(_scrollController.offset+150, duration: Duration(milliseconds: 200 ), curve: Curves.linear);
            }, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
      SizedBox(
        height:500,
        child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              ConferenceDetailsWidget(),
              ConferenceWidget(),
              OrganizerCollaboratorsView(),
              RegistrationCeremonyContent(),
              ClosingCeremonyContent(),
              ExhibitionDetails(),
              WorkshopContent(),
              PaperContent(),
              PanelContent(),
              KeynoteSpeakerContent(),
              PreviewItem()
            ],
          onPageChanged: (value) {
            controller.currentIndex.value = value;
          },
        ),
      )
    ],
  );
}


