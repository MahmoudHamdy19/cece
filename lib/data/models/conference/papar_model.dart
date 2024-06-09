class PaperModel {
  String? id;
  String? title;
  String? language;
  String? authorProfile;
  String? startDate;
  String? endDate;
  String? hall;

  PaperModel({
     this.id,
     this.title,
     this.language,
     this.authorProfile,
     this.startDate,
     this.endDate,
     this.hall,
  });

  factory PaperModel.fromJson(Map<String, dynamic> json) {
    return PaperModel(
      id: json['id'],
      title: json['title'],
      language: json['language'],
      authorProfile: json['authorProfile'],
      startDate: json['startDate'],
      endDate:json['endDate'],
      hall: json['hall'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'language': language,
      'authorProfile': authorProfile,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
    };
  }
}
