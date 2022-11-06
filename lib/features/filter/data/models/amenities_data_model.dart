import '../../domain/entities/amenities_domain_model.dart';

class AmenitiesFilterModel extends AmenitiesFilter {
  AmenitiesFilterModel({required super.data});

  factory AmenitiesFilterModel.fromJson(Map<String, dynamic> json) =>
      AmenitiesFilterModel(
        data: List<AmenitiesDatumModel>.from(
            json["data"].map((x) => AmenitiesDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AmenitiesDatumModel extends AmenitiesDatum {
  AmenitiesDatumModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKo,
      required super.image,
      required super.icon,
      required super.createdAt,
      required super.updatedAt});
  factory AmenitiesDatumModel.fromJson(Map<String, dynamic> json) => AmenitiesDatumModel(
    id: json["id"],
    nameAr: json["name_ar"]?? "بدون اسم",
    nameEn: json["name_en"]?? "No Name",
    nameKo: json["name_ko"]?? "هيچ ناو نييه‌",
    image: json["image"],
    icon: json["icon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "name_ko": nameKo,
    "image": image,
    "icon": icon,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
