class KeynoteModel {
  String? id;
  String? speakerName;
  String? language;
  String? topicName;
  String? startTime;
  String? endTime;
  String? startDate;
  String? endDate;
  String? hall;

  KeynoteModel({
     this.id,
     this.speakerName,
     this.language,
     this.topicName,
     this.startTime,
     this.endTime,
     this.startDate,
     this.endDate,
     this.hall,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'speakerName': speakerName,
      'language': language,
      'topicName': topicName,
      'startTime': startTime,
      'endTime': endTime,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
    };
  }

  factory KeynoteModel.fromJson(Map<String, dynamic> json) {
    return KeynoteModel(
      id: json['id'],
      speakerName: json['speakerName'],
      language: json['language'],
      topicName: json['topicName'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      hall: json['hall'],
    );
  }
}
