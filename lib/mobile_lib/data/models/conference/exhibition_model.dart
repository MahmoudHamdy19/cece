class ExhibitionDetailsModel {
  final String exhibitionName;
  final String companyName;
  final String startTime;
  final String endTime;
  final String startDate;
  final String endDate;
  final String hall;

  ExhibitionDetailsModel({
    required this.exhibitionName,
    required this.companyName,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.hall,
  });

  Map<String, dynamic> toJson() {
    return {
      'exhibitionName': exhibitionName,
      'companyName': companyName,
      'startTime': startTime,
      'endTime': endTime,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
    };
  }

  factory ExhibitionDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExhibitionDetailsModel(
      exhibitionName: json['exhibitionName'],
      companyName: json['companyName'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      hall: json['hall'],
    );
  }
}
