 import 'dart:typed_data';

class ConferenceModel {
  String? city;
  String? venue;
  String? conferenceName;
  String? conferenceDescription;
  String? image;
  Uint8List? imageFile;
  String? fontName;
  String? color;
  String? backgroundImage;
  Uint8List? backgroundImageFile;
    String? startDate;
    String? endDate;
  ConferenceModel({
    this.city,
    this.venue,
    this.conferenceName,
    this.conferenceDescription,
    this.image,
    this.backgroundImage,
    this.fontName,
    this.color,
    this.imageFile,
    this.backgroundImageFile,
    this.startDate,
    this.endDate,
  });

  factory ConferenceModel.fromJson(Map<String, dynamic> json) {
    return ConferenceModel(
      city: json['city'] ?? '',
      venue: json['venue'] ?? '',
      conferenceName: json['conference_name'] ?? '',
      conferenceDescription: json['conference_description'] ?? '',
      image: json['image'] ?? '',
      backgroundImage: json['backgroundImage'] ?? '',
      fontName: json['fontName'] ?? '',
      color: json['color'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'venue': venue,
      'conference_name': conferenceName,
      'conference_description': conferenceDescription,
      'image': image,
      'fontName': fontName,
      'color': color,
      'backgroundImage': backgroundImage,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  ConferenceModel copyWith({
    String? city,
    String? venue,
    String? conferenceName,
    String? conferenceDescription,
    String? image,
    Uint8List? imageFile,
    String? fontName,
    String? color,
    String? backgroundImage,

  }) {
    return ConferenceModel(
      city: city ?? this.city,
      venue: venue ?? this.venue,
      conferenceName: conferenceName ?? this.conferenceName,
      conferenceDescription: conferenceDescription ?? this.conferenceDescription,
      image: image ?? this.image,
      imageFile: imageFile ?? this.imageFile,
      fontName: fontName ?? this.fontName,
      color: color ?? this.color,
      backgroundImage: backgroundImage ?? this.backgroundImage,
    );
  }

  void update({
    String? city,
    String? venue,
    String? conferenceName,
    String? conferenceDescription,
    String? image,
    String? fontName,
    String? color,
    String? backgroundImage,
  }) {
    this.city = city ?? this.city;
    this.venue = venue ?? this.venue;
    this.conferenceName = conferenceName ?? this.conferenceName;
    this.conferenceDescription = conferenceDescription ?? this.conferenceDescription;
    this.image = image ?? this.image;
    this.fontName = fontName ?? this.fontName;
    this.color = color ?? this.color;
    this.backgroundImage = backgroundImage ?? this.backgroundImage;
  }
}
