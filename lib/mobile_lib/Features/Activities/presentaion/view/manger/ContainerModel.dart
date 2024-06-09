import 'dart:ui';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/mobile_lib/Features/Activities/presentaion/view/exhibition_details.dart';
import 'package:cece/mobile_lib/Features/Activities/presentaion/view/keynote_speaker_details.dart';
import 'package:cece/mobile_lib/Features/Activities/presentaion/view/panel_discussions_details.dart';
import 'package:cece/mobile_lib/Features/Activities/presentaion/view/paper_session.dart';
import 'package:cece/mobile_lib/Features/Activities/presentaion/view/workshop_details.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/Assets Manager.dart';
class ContainerModel {
  final String image;
  final String title;
  final Color color;
  final ontap;

  ContainerModel( {
    required this.title,
    required this.ontap,required this.color,
    required this.image,
  });
}

List<ContainerModel>  containerModel (OrganizerEvents? conference)=> [
  ContainerModel(
    ontap:ExhibitionDetails(conference),
color: AppColors.primaryColor,
    image: AssetsManager.Exhibition,
    title: 'Exhibition Details',
  ),  ContainerModel(
    ontap: WorkshopDetails(conference),
color: AppColors.primaryColor,
    image: AssetsManager.workshop,
    title: 'workshop Details',
  ),
  ContainerModel(
    ontap:PaperSessionDetails(conference),
    image: AssetsManager.seminar,
    color: AppColors.primaryColor,
    title: 'Paper Session',
  ),
  ContainerModel(
    ontap: PanelDiscussionsDetails(conference),
    image: AssetsManager.communication,
    color: AppColors.primaryColor,

    title: 'Panel Discussions Details',
  ),
  ContainerModel(
    ontap: KeynoteSpeakerDetails(conference),
    image: AssetsManager.speaker,
    color: AppColors.primaryColor,
    title: 'Keynote Speaker Details',
  ),
];
