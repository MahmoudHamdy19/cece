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

class OrganizerUpdateProjectController extends GetxController {

  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
   final Rx<Uint8List?> conferenceImageUint8List = Rx<Uint8List?>(null);
  final Rx<Uint8List?> conferenceBackgroundImageUint8List = Rx<Uint8List?>(null);

  // conference
  late final TextEditingController conferenceNameController  ;
  late final TextEditingController conferenceDescriptionController  ;
  late final TextEditingController cityController  ;
  late final TextEditingController venueController  ;
  late final RxString fontController  ;
  late final TextEditingController colorController  ;
  late  final TextEditingController conferenceStartDateController ;
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  late final TextEditingController conferenceEndDateController ;

  // closing
  late final TextEditingController closingStartTimeController ;
  late final TextEditingController closingEndTimeController ;
  late final TextEditingController closingStartDateController ;
  late final TextEditingController closingEndDateController ;
  late final TextEditingController closingHallController ;
  // registration
 late final TextEditingController registrationStartTimeController ;
 late final TextEditingController registrationEndTimeController ;
 late final TextEditingController registrationStartDateController ;
 late final TextEditingController registrationEndDateController ;
 late final TextEditingController registrationHallController ;
  //exhibition
  late final TextEditingController exhibitionNameController ;
  late final TextEditingController exhibitionCompanyNameController ;
 RxList<String> exhibitionCompanysName = RxList<String>();
  late final TextEditingController exhibitionStartTimeController ;
  late final TextEditingController exhibitionEndTimeController ;
  late final TextEditingController exhibitionStartDateController ;
  late final TextEditingController exhibitionEndDateController ;
  late final TextEditingController exhibitionHallController ;


  // Collaborators
  RxList<CollaboratorModel> speakers = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> authors = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> moderators = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> participants = <CollaboratorModel>[].obs;
  RxList<CollaboratorModel> presenters = <CollaboratorModel>[].obs;

  RxList<WorkshopModel> workshopModel = RxList<WorkshopModel>([]);
  RxList<PaperModel>    paperModel    = RxList<PaperModel>([]);
  RxList<PanelModel>    panelModel    = RxList<PanelModel>([]);
  RxList<KeynoteModel>  keynoteModel  = RxList<KeynoteModel>([]);

  // remote data source
  UserRemoteDataSource userRemoteDataSource = Get.find<UserRemoteDataSource>();
  // flow state
  Rx<FlowState> state = Rx<FlowState>(ContentState());

  OrganizerEvents conference  = Get.arguments?? OrganizerEvents(created: DateTime.now());

  @override
  void onInit() {
    // conference
    conferenceNameController = TextEditingController(text: conference.conferenceDetails?.conferenceName);
    conferenceDescriptionController = TextEditingController(text: conference.conferenceDetails?.conferenceDescription);
    conferenceStartDateController = TextEditingController(text: conference.conferenceDetails?.startDate);
    conferenceEndDateController = TextEditingController(text: conference.conferenceDetails?.endDate);
    cityController = TextEditingController(text: conference.conferenceDetails?.city);
    venueController = TextEditingController(text: conference.conferenceDetails?.venue);
     fontController = fontListMap.keys.toList().firstWhere((element) => element == conference.conferenceDetails?.fontName,orElse: null).obs;
    colorController = TextEditingController(text: conference.conferenceDetails?.color);
    // closing
    closingStartTimeController = TextEditingController(text: conference.closingCeremony?.startTime);
    closingEndTimeController = TextEditingController(text: conference.closingCeremony?.endTime);
    closingStartDateController = TextEditingController(text: conference.closingCeremony?.startDate);
    closingEndDateController = TextEditingController(text: conference.closingCeremony?.endDate);
    closingHallController = TextEditingController(text: conference.closingCeremony?.hall);
    //  registration
    registrationStartTimeController = TextEditingController(text: conference.registrationCeremony?.startTime);
    registrationEndTimeController = TextEditingController(text: conference.registrationCeremony?.endTime);
    registrationStartDateController = TextEditingController(text: conference.registrationCeremony?.startDate);
    registrationEndDateController = TextEditingController(text: conference.registrationCeremony?.endDate);
    registrationHallController = TextEditingController(text: conference.registrationCeremony?.hall);
    //exhibition
    exhibitionNameController = TextEditingController(text: conference.exhibitionCeremony?.exhibitionName);
    exhibitionCompanyNameController = TextEditingController();
    exhibitionCompanysName.value = conference.exhibitionCeremony?.companyName??[];
    exhibitionStartTimeController = TextEditingController(text: conference.exhibitionCeremony?.startTime);
    exhibitionEndTimeController = TextEditingController(text: conference.exhibitionCeremony?.endTime);
    exhibitionStartDateController = TextEditingController(text: conference.exhibitionCeremony?.startTime);
    exhibitionEndDateController = TextEditingController(text: conference.exhibitionCeremony?.endDate);
    exhibitionHallController = TextEditingController(text: conference.exhibitionCeremony?.hall);

    // Collaborators
    speakers.value = conference.speakers??[];
    authors.value = conference.authors??[];
    moderators.value = conference.moderators??[];
    participants.value = conference.participants??[];
    presenters.value = conference.presenters??[];

    workshopModel.value = conference.workshopList??[] ;
    paperModel.value = conference.paperContentList??[] ;
    panelModel.value = conference.panelList??[] ;
    keynoteModel.value = conference.keynoteSpeakerList??[] ;


    super.onInit();
  }
  OrganizerEvents get getConference => OrganizerEvents(
    created: DateTime.now(),
    closingCeremony: ClosingCeremonyModel(startTime: closingStartTimeController.text,
        endTime: closingEndTimeController.text,
        startDate: closingStartDateController.text, endDate: closingEndDateController.text , hall: closingHallController.text) ,
    conferenceDetails: ConferenceModel(
      color: colorController.text ,
      startDate: conferenceStartDateController.text ,
      endDate: conferenceEndDateController.text ,
      conferenceName: conferenceNameController.text ,
      imageFile:conferenceImageUint8List.value,
      city: cityController.text ,
      conferenceDescription: conferenceDescriptionController.text ,
      fontName: fontController.value ,
      venue: venueController.text ,
      backgroundImage: conference.conferenceDetails?.backgroundImage,
      image: conference.conferenceDetails?.image,
      backgroundImageFile: conferenceBackgroundImageUint8List.value,
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
    authors: authors,
    moderators: moderators,
    participants: participants,
    presenters: presenters,
    speakers: speakers,
    status: conference.status,
    uid: conference.uid ,
  );


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


  void updateConference()async{
    var conf = OrganizerEvents(
      created: DateTime.now(),
      closingCeremony: ClosingCeremonyModel(startTime: closingStartTimeController.text,
          endTime: closingEndTimeController.text,
          startDate: closingStartDateController.text, endDate: closingEndDateController.text , hall: closingHallController.text) ,
      conferenceDetails: ConferenceModel(
        color: colorController.text ,
         startDate: conferenceStartDateController.text ,
        endDate: conferenceEndDateController.text ,
        conferenceName: conferenceNameController.text ,
        imageFile:conferenceImageUint8List.value,
        city: cityController.text ,
        conferenceDescription: conferenceDescriptionController.text ,
        fontName: fontController.value ,
        venue: venueController.text ,
        backgroundImage: conference.conferenceDetails?.backgroundImage,
        image: conference.conferenceDetails?.image,
        backgroundImageFile: conferenceBackgroundImageUint8List.value,
       ),
      exhibitionCeremony: ExhibitionDetailsModel(exhibitionName: exhibitionNameController.text,
          companyName: exhibitionCompanysName,
          startTime: exhibitionStartTimeController.text, endTime: exhibitionEndTimeController.text,
          startDate: exhibitionStartDateController.text, endDate: exhibitionEndDateController.text, hall: exhibitionHallController.text),
      keynoteSpeakerList:keynoteModel,
      panelList: panelModel,
      paperContentList: paperModel,
      registrationCeremony: RegistrationCeremonyModel(startTime: registrationStartTimeController.text,
          endTime: registrationEndTimeController.text, startDate: registrationStartDateController.text,
          endDate: registrationEndDateController.text, hall: registrationHallController.text),
      workshopList: workshopModel,
      authors: authors,
      moderators: moderators,
      participants: participants,
      presenters: presenters,
      speakers: speakers,
      status: 0,
      uid: conference.uid ,
    );

    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await userRemoteDataSource.updateConference(conf)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      state.value = SuccessState(StateRendererType.fullScreenSuccessState,'Successfully Update Conference');
    });
  }


  void deleteConference()async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await userRemoteDataSource.deleteConference(conference.uid)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      Get.offAllNamed(AppRoutes.organizerSeePreviousProjectsScreen);
      state.value = SuccessState(StateRendererType.fullScreenSuccessState,'Successfully deleted Conference');
    });
  }
}
