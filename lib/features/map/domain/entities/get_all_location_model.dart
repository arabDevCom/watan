import 'dart:convert';

AllLocationsModel allLocationsFromJson(String str) => AllLocationsModel.fromJson(json.decode(str));

String allLocationsToJson(AllLocationsModel data) => json.encode(data.toJson());

class AllLocationsModel {
  AllLocationsModel({
    this.data,
  });

  AllLocationsData? data;

  factory AllLocationsModel.fromJson(Map<String, dynamic> json) => AllLocationsModel(
    data: AllLocationsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class AllLocationsData {
  AllLocationsData({
    this.adsLocations,
    this.projectsLocations,
  });

  List<SLocation>? adsLocations;
  List<SLocation>? projectsLocations;

  factory AllLocationsData.fromJson(Map<String, dynamic> json) => AllLocationsData(
    adsLocations: List<SLocation>.from(json["ads_locations"].map((x) => SLocation.fromJson(x))),
    projectsLocations: List<SLocation>.from(json["projects_locations"].map((x) => SLocation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ads_locations": List<dynamic>.from(adsLocations!.map((x) => x.toJson())),
    "projects_locations": List<dynamic>.from(projectsLocations!.map((x) => x.toJson())),
  };
}

class SLocation {
  SLocation({
    this.id,
    this.longitude,
    this.latitude,
  });

  int? id;
  double? longitude;
  double? latitude;

  factory SLocation.fromJson(Map<String, dynamic> json) => SLocation(
    id: json["id"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "longitude": longitude,
    "latitude": latitude,
  };
}
