class RegistrationCeremonyModel {
  final String startTime;
  final String endTime;
  final String startDate;
  final String endDate;
  final String hall;

  RegistrationCeremonyModel({
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.hall,
  });

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'startDate': startDate,
      'endDate': endDate,
      'hall': hall,
    };
  }

  factory RegistrationCeremonyModel.fromJson(Map<String, dynamic> json) {
    return RegistrationCeremonyModel(
      startTime: json['startTime'],
      endTime: json['endTime'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      hall: json['hall'],
    );
  }
}
