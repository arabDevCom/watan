import '../../domain/entities/bloggs_domain_model.dart';

class BloggsModel extends Bloggs {
  const BloggsModel({required super.data});

  factory BloggsModel.fromJson(Map<String, dynamic> json) => BloggsModel(
        data: List<BloggsDatumModel>.from(
            json["data"].map((x) => BloggsDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BloggsDatumModel extends BloggsDatum {
  const BloggsDatumModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKu,
      required super.image,
      required super.descriptionAr,
      required super.descriptionEn,
      required super.descriptionKu,
      required super.createdAt,
      required super.updatedAt});

  factory BloggsDatumModel.fromJson(Map<String, dynamic> json) => BloggsDatumModel(
    id: json["id"],
    nameAr: json["name_ar"]?? "بدون اسم",
    nameEn: json["name_en"]?? "No Name",
    nameKu: json["name_ku"]?? "هيچ ناو نييه‌",
    image: json["image"],
    descriptionAr: json["description_ar"]?? "بدون وصف",
    descriptionEn: json["description_en"]?? "No Description ",
    descriptionKu: json["description_ku"]?? "هیچ وەسفێک نییە",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "name_ku": nameKu,
    "image": image,
    "description_ar": descriptionAr,
    "description_en": descriptionEn,
    "description_ku": descriptionKu,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };

}
