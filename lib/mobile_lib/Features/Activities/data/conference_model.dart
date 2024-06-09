class Conference {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String fromDate;
  final String toDate;
  final String? registrationLocation;
  final String? closingCeremonyLocation;
  final String? exhibitionName;
  final String? exhibitionLocation;
  final String? companyName;
  final String? workshopHall;
  final String? workshopTopic;
  final String? workshopLanguage;
  final String? workshopPresenterProfile;
  final String? keynoteHall;
  final String? keynoteTopic;
  final String? keynoteSpeakerName;
  final String? keynoteLanguage;
  final String? keynotePresenterProfile;
  final String? location;
  final String? paperTitle;
  final String? paperProfile;
  final String? paperLanguage;
  final String? paperHall;

  final String? PanelTopic;
  final String? PanelModeratorProfile;
  final String? PanelParticipantsProfil;
  final String? PanelHall;

  Conference({this.paperTitle, this.paperProfile,
    this.paperLanguage,
    this.PanelTopic, this.PanelModeratorProfile, this.PanelParticipantsProfil,
    this.PanelHall,
    this.paperHall,
    required this.imageUrl,this.location,
    required this.title,
    required this.subtitle,
    required this.fromDate,
    required this.toDate,
    this.registrationLocation,
    this.closingCeremonyLocation,
    this.exhibitionName,
    this.exhibitionLocation,
    this.companyName,
    this.workshopHall,
    this.workshopTopic,
    this.workshopLanguage,
    this.workshopPresenterProfile,
    this.keynoteHall,
    this.keynoteTopic,
    this.keynoteSpeakerName,
    this.keynoteLanguage,
    this.keynotePresenterProfile,
  });
}
