

import '../collaborator_model.dart';
import '../user/user_model.dart';
import 'closing_model.dart';
import 'exhibition_model.dart';
import 'keynote_model.dart';
import 'panel_model.dart';
import 'papar_model.dart';
import 'registration_model.dart';
import 'workshop_model.dart';
import 'conference_model.dart';

class OrganizerEvents {
  List<KeynoteModel>? keynoteSpeakerList;
  List<PanelModel>? panelList;
  List<WorkshopModel>? workshopList;
  List<PaperModel>? paperContentList;
  List<CollaboratorModel>? speakers;
  List<CollaboratorModel>? authors;
  List<CollaboratorModel>? moderators;
  List<CollaboratorModel>? participants;
  List<CollaboratorModel>? presenters;
  ClosingCeremonyModel? closingCeremony;
  RegistrationCeremonyModel? registrationCeremony;
  ExhibitionDetailsModel? exhibitionCeremony;
  ConferenceModel? conferenceDetails;
  UserModel? user ;
  int status;
  String uid;

  OrganizerEvents({
    this.keynoteSpeakerList,
    this.panelList,
    this.workshopList,
    this.paperContentList,
    this.closingCeremony,
    this.registrationCeremony,
    this.exhibitionCeremony,
    this.conferenceDetails,
    this.uid = '',
    this.speakers,
    this.authors,
    this.moderators,
    this.participants,
    this.presenters,
    this.status = 0,
  });

  factory OrganizerEvents.fromJson(Map<String, dynamic> json) {
    return OrganizerEvents(
      keynoteSpeakerList: (json['keynoteSpeakerList'] as List<dynamic>?)
          ?.map((e) => KeynoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      panelList: (json['panelList'] as List<dynamic>?)
          ?.map((e) => PanelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      workshopList: (json['workshopList'] as List<dynamic>?)
          ?.map((e) => WorkshopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paperContentList: (json['paperContentList'] as List<dynamic>?)
          ?.map((e) => PaperModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      closingCeremony: json['closingCeremony'] != null
          ? ClosingCeremonyModel.fromJson(
          json['closingCeremony'] as Map<String, dynamic>)
          : null,
      registrationCeremony: json['registrationCeremony'] != null
          ? RegistrationCeremonyModel.fromJson(
          json['registrationCeremony'] as Map<String, dynamic>)
          : null,
      exhibitionCeremony: json['exhibitionCeremony'] != null
          ? ExhibitionDetailsModel.fromJson(
          json['exhibitionCeremony'] as Map<String, dynamic>)
          : null,
      conferenceDetails: json['conferenceDetails'] != null
          ? ConferenceModel.fromJson(
          json['conferenceDetails'] as Map<String, dynamic>)
          : null,
      uid: json['uid'] ?? '',
      speakers: (json['speakers'] as List<dynamic>?)
          ?.map((e) => CollaboratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => CollaboratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderators: (json['moderators'] as List<dynamic>?)
          ?.map((e) => CollaboratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => CollaboratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      presenters: (json['presenters'] as List<dynamic>?)
          ?.map((e) => CollaboratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'keynoteSpeakerList':
      keynoteSpeakerList?.map((e) => e.toJson()).toList(),
      'panelList': panelList?.map((e) => e.toJson()).toList(),
      'workshopList': workshopList?.map((e) => e.toJson()).toList(),
      'paperContentList': paperContentList?.map((e) => e.toJson()).toList(),
      'closingCeremony': closingCeremony?.toJson(),
      'registrationCeremony': registrationCeremony?.toJson(),
      'exhibitionCeremony': exhibitionCeremony?.toJson(),
      'conferenceDetails': conferenceDetails?.toJson(),
      'speakers': speakers?.map((e) => e.toJson()).toList(),
      'authors': authors?.map((e) => e.toJson()).toList(),
      'moderators': moderators?.map((e) => e.toJson()).toList(),
      'participants': participants?.map((e) => e.toJson()).toList(),
      'presenters': presenters?.map((e) => e.toJson()).toList(),
      'status': status,
      'uid': uid,
    };
  }
}
