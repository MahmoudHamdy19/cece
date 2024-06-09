class PanelModel {
    String? id;
    String? topic;
    String? moderatorProfile;
    String? participantProfile;
    String? startDate;
    String? endDate;
    String? hall;

  PanelModel({
     this.id,
     this.topic,
     this.moderatorProfile,
     this.participantProfile,
     this.startDate,
     this.endDate,
     this.hall,
  });

  factory PanelModel.fromJson(Map<String, dynamic> json) {
    return PanelModel(
      id: json['id'],
      topic: json['topic'],
      moderatorProfile: json['moderatorProfile'],
      participantProfile: json['participantProfile'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      hall: json['hall'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic': topic,
      'moderatorProfile': moderatorProfile,
      'participantProfile': participantProfile,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
    };
  }
}
