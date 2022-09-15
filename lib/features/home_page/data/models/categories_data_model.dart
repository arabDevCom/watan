import '../../domain/entities/categories_domain_model.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({required super.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<CategoriesDatumModel>.from(
            json["data"].map((x) => CategoriesDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoriesDatumModel extends CategoriesDatum {
  const CategoriesDatumModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKo,
      required super.image,
      required super.createdAt,
      required super.updatedAt});

  factory CategoriesDatumModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDatumModel(
        id: json["id"],
        nameAr: json["name_ar"]??"لا يوجد اسم",
        nameEn: json["name_en"]??"No Name",
        nameKo: json["name_ko"]??"هيچ ناو نييه‌",
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "name_ko": nameKo,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
