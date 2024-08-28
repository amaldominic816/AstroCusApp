// ignore_for_file: non_constant_identifier_names

class KundliModel {
  KundliModel({this.id, required this.name, required this.gender, required this.birthDate, required this.birthTime, required this.birthPlace, this.latitude, this.longitude, this.timezone,this.pdf_type,this.direction,this.forMatch,this.lang});
  int? id;
  String name;
  String gender;
  DateTime birthDate;
  String birthTime;
  String birthPlace;
  double? latitude;
  double? longitude;
  double? timezone;
  String ?pdf_type;
  String ?direction;
  int ?forMatch;
  String? lang;

  factory KundliModel.fromJson(Map<String, dynamic> json) => KundliModel(
        id: json["id"],
        name: json["name"] ?? "",
        gender: json["gender"] ?? "",
        birthDate: json["birthDate"] != null ? DateTime.parse(json["birthDate"]) : DateTime.now(),
        birthTime: json["birthTime"] ?? "",
        birthPlace: json["birthPlace"] ?? "",
        latitude: (json["latitude"] != null && json["latitude"] != '') ? double.parse(json["latitude"].toString()) : 0,
        longitude: (json["longitude"] != null && json["longitude"] != '') ? double.parse(json["longitude"].toString()) : 0,
        timezone: (json["timezone"] != null && json["timezone"] != '') ? double.parse(json["timezone"].toString()) : 0,
      pdf_type:json['pdf_type'],
      direction:json['match_type'],
      forMatch:json['forMatch'],
    lang:json['lang'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "birthDate": birthDate.toIso8601String(),
        "birthTime": birthTime,
        "birthPlace": birthPlace,
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
    "pdf_type":pdf_type,
    "match_type":direction,
    "forMatch":forMatch,
    "lang":lang,
      };
}

class KundliBasicModel {
  KundliBasicModel({
    this.id,
    required this.Tithi,
    required this.Karan,
    required this.Yog,
    required this.Nakshatra,
    required this.SunRise,
    required this.SunSet,
  });
  int? id;
  String Tithi;
  String Karan;
  String Yog;
  String Nakshatra;
  String SunRise;
  String SunSet;

  factory KundliBasicModel.fromJson(Map<String, dynamic> json) => KundliBasicModel(
        id: json["id"],
        Tithi: json["Tithi"],
        Karan: json["Karan"],
        Yog: json["Yog"],
        Nakshatra: json["Nakshatra"],
        SunRise: json["SunRise"],
        SunSet: json["SunSet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Tithi": Tithi,
        "Karan": Karan,
        "Yog": Yog,
        "Nakshatra": Nakshatra,
        "SunRise": SunRise,
        "SunSet": SunSet,
      };
}
