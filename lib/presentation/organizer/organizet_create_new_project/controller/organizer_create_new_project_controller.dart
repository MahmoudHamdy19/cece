 import 'dart:typed_data';
import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/models/collaborator_model.dart';
import 'package:cece/data/models/conference/closing_model.dart';
import 'package:cece/data/models/conference/conference_model.dart';
import 'package:cece/data/models/conference/exhibition_model.dart';
import 'package:cece/data/models/conference/keynote_model.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/data/models/conference/panel_model.dart';
import 'package:cece/data/models/conference/papar_model.dart';
import 'package:cece/data/models/conference/registration_model.dart';
import 'package:cece/data/models/conference/workshop_model.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';
import 'package:flutter/material.dart';
 import 'package:image_picker/image_picker.dart';

class OrganizerCreateNewProjectController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
   final Rx<Uint8List?> conferenceImageUint8List = Rx<Uint8List?>(null);
   final Rx<Uint8List?> conferenceBackgroundImageUint8List = Rx<Uint8List?>(null);
   // conference
  final TextEditingController conferenceNameController = TextEditingController();
  final TextEditingController conferenceDescriptionController = TextEditingController();
  final TextEditingController conferenceStartDateController = TextEditingController();
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  final TextEditingController conferenceEndDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final RxString fontController = fontListMap.keys.toList()[0].obs;
  final TextEditingController colorController = TextEditingController();
  Rx<Color?> selectedColor = Rx<Color?>(null);
  // closing
  final TextEditingController closingStartTimeController = TextEditingController();
  final TextEditingController closingEndTimeController = TextEditingController();
  final TextEditingController closingStartDateController = TextEditingController();
  final TextEditingController closingEndDateController = TextEditingController();
  final TextEditingController closingHallController = TextEditingController();
  // registration
  final TextEditingController registrationStartTimeController = TextEditingController();
  final TextEditingController registrationEndTimeController = TextEditingController();
  final TextEditingController registrationStartDateController = TextEditingController();
  final TextEditingController registrationEndDateController = TextEditingController();
  final TextEditingController registrationHallController = TextEditingController();
  //exhibition
  final TextEditingController exhibitionNameController = TextEditingController();
  final TextEditingController exhibitionCompanyNameController = TextEditingController();
  RxList<String> exhibitionCompanysName = RxList<String>();
  final TextEditingController exhibitionStartTimeController = TextEditingController();
  final TextEditingController exhibitionEndTimeController = TextEditingController();
  final TextEditingController exhibitionStartDateController = TextEditingController();
  final TextEditingController exhibitionEndDateController = TextEditingController();
  final TextEditingController exhibitionHallController = TextEditingController();


  // Collaborators
  RxList<CollaboratorModel> speakers = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> authors = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> moderators = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> participants = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> presenters = <CollaboratorModel>[].obs;

  RxList<WorkshopModel> workshopModel = RxList<WorkshopModel>([]);
  RxList<PaperModel> paperModel = RxList<PaperModel>([]);
  RxList<PanelModel> panelModel = RxList<PanelModel>([]);
  RxList<KeynoteModel> keynoteModel = RxList<KeynoteModel>([]);

  // remote data source
  UserRemoteDataSource userRemoteDataSource = Get.find<UserRemoteDataSource>();
  // flow state
  Rx<FlowState> state = Rx<FlowState>(ContentState());

  toggleTap(int index){
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
  void pickConferenceImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
    if (file != null) {
      conferenceImageUint8List.value = await file.readAsBytes();
     }
  }

  void pickConferenceBackgroundImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
    if (file != null) {
      conferenceBackgroundImageUint8List.value = await file.readAsBytes();
    }
  }

  OrganizerEvents get getConference =>  OrganizerEvents(
     created: DateTime.now(),
    closingCeremony: ClosingCeremonyModel(startTime: closingStartTimeController.text,
        endTime: closingEndTimeController.text,
        startDate: closingStartDateController.text, endDate: closingEndDateController.text ,
        hall: closingHallController.text),
        conferenceDetails: ConferenceModel(
       startDate: conferenceStartDateController.text,
      endDate: conferenceEndDateController.text,
      backgroundImageFile:conferenceBackgroundImageUint8List.value,
      color: colorController.text ,
      conferenceName: conferenceNameController.text ,
      imageFile:conferenceImageUint8List.value,
      city: cityController.text ,
      conferenceDescription: conferenceDescriptionController.text ,
      fontName: fontController.value ,
      venue: venueController.text ,
    ),
    exhibitionCeremony: ExhibitionDetailsModel(exhibitionName: exhibitionNameController.text,
        companyName: exhibitionCompanysName,
        startTime: exhibitionStartTimeController.text, endTime: exhibitionEndTimeController.text,
        startDate: exhibitionStartDateController.text, endDate: exhibitionEndDateController.text, hall: exhibitionHallController.text),
    keynoteSpeakerList:keynoteModel,
    panelList: panelModel ,
    paperContentList: paperModel ,
    registrationCeremony: RegistrationCeremonyModel(startTime: registrationStartTimeController.text,
        endTime: registrationEndTimeController.text, startDate: registrationStartDateController.text,
        endDate: registrationEndDateController.text, hall: registrationHallController.text),
    workshopList: workshopModel,
    speakers: speakers,
    authors: authors,
    moderators: moderators,
    participants: participants,
    presenters: presenters,
    status: 0,
  ) ;

  void addConference()async{
    var conf = OrganizerEvents(
      created: DateTime.now(),
      closingCeremony: ClosingCeremonyModel(startTime: closingStartTimeController.text,
          endTime: closingEndTimeController.text,
          startDate: closingStartDateController.text, endDate: closingEndDateController.text , hall: closingHallController.text) ,
      conferenceDetails: ConferenceModel(
        backgroundImageFile:conferenceBackgroundImageUint8List.value,
        startDate: conferenceStartDateController.text,
        endDate: conferenceEndDateController.text,
        color: colorController.text ,
        conferenceName: conferenceNameController.text ,
        imageFile:conferenceImageUint8List.value,
        city: cityController.text ,
        conferenceDescription: conferenceDescriptionController.text ,
        fontName: fontController.value ,
        venue: venueController.text ,
       ),
      exhibitionCeremony: ExhibitionDetailsModel(exhibitionName: exhibitionNameController.text,
          companyName: exhibitionCompanysName,
          startTime: exhibitionStartTimeController.text, endTime: exhibitionEndTimeController.text,
          startDate: exhibitionStartDateController.text, endDate: exhibitionEndDateController.text, hall: exhibitionHallController.text),
      keynoteSpeakerList:keynoteModel,
      panelList: panelModel ,
      paperContentList: paperModel ,
      registrationCeremony: RegistrationCeremonyModel(startTime: registrationStartTimeController.text,
          endTime: registrationEndTimeController.text, startDate: registrationStartDateController.text,
          endDate: registrationEndDateController.text, hall: registrationHallController.text),
      workshopList: workshopModel,
      speakers: speakers,
      authors: authors,
      moderators: moderators,
      participants: participants,
      presenters: presenters,
      status: 0,
    );

    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await userRemoteDataSource.addConference(conf)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      state.value = SuccessState(StateRendererType.fullScreenSuccessState,'Successfully added Conference');
    });
  }

}
