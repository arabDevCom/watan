import '../../domain/entities/angent_list_domain_model.dart';

class FilterAgentListModel extends FilterAgentList {
  const FilterAgentListModel({required super.data});

  factory FilterAgentListModel.fromJson(Map<String, dynamic> json) =>
      FilterAgentListModel(
        data: List<FilterAgentListDatumModel>.from(
            json["data"].map((x) => FilterAgentListDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FilterAgentListDatumModel extends FilterAgentListDatum {
  const FilterAgentListDatumModel({
    required super.id,
    required super.nameAr,
    required super.nameEn,
    required super.nameKu,
    required super.image,
    required super.about,
    required super.phone,
    required super.email,
    required super.languages,
    required super.password,
    required super.facebook,
    required super.instagram,
    required super.twitter,
    required super.snapchat,
    required super.phoneCode,
    required super.whatsapp,
    required super.userId,
    required super.companyId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FilterAgentListDatumModel.fromJson(Map<String, dynamic> json) =>
      FilterAgentListDatumModel(
        id: json["id"],
        nameAr: json["name_ar"]?? "بدون اسم",
        nameEn: json["name_en"]?? "No Name",
        nameKu: json["name_ku"]?? "هيچ ناو نييه‌",
        image: json["image"],
        about: json["about"],
        phone: json["phone"],
        email: json["email"],
        languages: json["languages"],
        password: json["password"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        snapchat: json["snapchat"],
        phoneCode: json["phone_code"],
        whatsapp: json["whatsapp"],
        userId: json["user_id"],
        companyId: json["company_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "name_ku": nameKu,
        "image": image,
        "about": about,
        "phone": phone,
        "email": email,
        "languages": languages,
        "password": password,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
        "snapchat": snapchat,
        "phone_code": phoneCode,
        "whatsapp": whatsapp,
        "user_id": userId,
        "company_id": companyId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
