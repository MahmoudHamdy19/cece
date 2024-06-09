class WorkshopModel {
   String? id;
   String? topic;
   String? language;
   String? presenter;
   String? startTime;
   String? endTime;
   String? startDate;
   String? endDate;
   String? hall;

  WorkshopModel({
      this.topic,
      this.id ,
      this.language,
      this.presenter,
      this.startTime,
      this.endTime,
      this.startDate,
      this.endDate,
      this.hall,
  });

  // Method to create a WorkshopContentModel object from a JSON map
  factory WorkshopModel.fromJson(Map<String, dynamic> json) {
    return WorkshopModel(
      topic: json['topic'] as String?,
      id: json['id'] as String?,
      language: json['language'] as String?,
      presenter: json['presenter'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      hall: json['hall'] as String?,
    );
  }

  // Method to convert a WorkshopContentModel object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'language': language,
      'presenter': presenter,
      'startTime': startTime,
      'endTime': endTime,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
      'id':id
    };
  }
}
