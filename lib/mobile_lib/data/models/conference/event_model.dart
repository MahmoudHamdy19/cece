class Event {
  String? title;
  String? language;
  String? authorProfile;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String hall;
  String? topic;
  String? presenterProfile;
  String? moderatorProfile;
  String? participantsProfile;
  String? speakerProfile;
  List<String>? companyName;
  String? exhibitionName;

  Event({
    this.title,
    this.language,
    this.authorProfile,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    required this.hall,
    this.topic,
    this.presenterProfile,
    this.moderatorProfile,
    this.participantsProfile,
    this.speakerProfile,
    this.companyName,
    this.exhibitionName,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      language: json['language'],
      authorProfile: json['authorProfile'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      hall: json['hall'],
      topic: json['topic'],
      presenterProfile: json['presenterProfile'],
      moderatorProfile: json['moderatorProfile'],
      participantsProfile: json['participantsProfile'],
      speakerProfile: json['speakerProfile'],
      companyName: json['companyName'] != null
          ? List<String>.from(json['companyName'])
          : null,
      exhibitionName: json['exhibitionName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'language': language,
      'authorProfile': authorProfile,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
      'hall': hall,
      'topic': topic,
      'presenterProfile': presenterProfile,
      'moderatorProfile': moderatorProfile,
      'participantsProfile': participantsProfile,
      'speakerProfile': speakerProfile,
      'companyName': companyName,
      'exhibitionName': exhibitionName,
    };
  }
}
