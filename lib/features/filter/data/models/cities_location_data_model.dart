import '../../domain/entities/cities_location_domain_model.dart';

class CitiesLocationsModel extends CitiesLocations {
  CitiesLocationsModel({required super.data});

  factory CitiesLocationsModel.fromJson(Map<String, dynamic> json) =>
      CitiesLocationsModel(
        data: List<CitiesLocationDatumModel>.from(
            json["data"].map((x) => CitiesLocationDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CitiesLocationDatumModel extends CitiesLocationDatum {
  CitiesLocationDatumModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKu,
      required super.areaId,
      required super.createdAt,
      required super.updatedAt});

  factory CitiesLocationDatumModel.fromJson(Map<String, dynamic> json) => CitiesLocationDatumModel(
    id: json["id"],
    nameAr: json["name_ar"]?? "بدون اسم",
    nameEn: json["name_en"]?? "No Name",
    nameKu: json["name_ku"]?? "هيچ ناو نييه‌",
    areaId: json["area_id"]?? "هيچ ناو نييه‌",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "name_ku": nameKu,
    "area_id": areaId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };

}
