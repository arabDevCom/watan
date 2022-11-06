import '../../domain/entities/cities_domian_model.dart';

class CitiesFilterModel extends CitiesFilter {
  CitiesFilterModel({required super.data});

  factory CitiesFilterModel.fromJson(Map<String, dynamic> json) =>
      CitiesFilterModel(
        data: List<CitiesDatumModel>.from(
            json["data"].map((x) => CitiesDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CitiesDatumModel extends CitiesDatum {
  CitiesDatumModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKu,
      required super.image,
      required super.createdAt,
      required super.updatedAt});
  factory CitiesDatumModel.fromJson(Map<String, dynamic> json) => CitiesDatumModel(
    id: json["id"],
    nameAr: json["name_ar"]?? "بدون اسم",
    nameEn: json["name_en"]?? "No Name",
    nameKu: json["name_ku"]?? "هيچ ناو نييه‌",
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "name_ku": nameKu,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
