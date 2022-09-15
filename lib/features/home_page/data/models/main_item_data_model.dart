import '../../domain/entities/main_item_domain_model.dart';

class MainItemModel extends MainItem {
  MainItemModel(
      {required super.id,
      required super.status,
      required super.phone,
      required super.phoneCode,
      required super.views,
      required super.titleAr,
      required super.descriptionAr,
      required super.titleEn,
      required super.descriptionEn,
      required super.titleKu,
      required super.descriptionKu,
      required super.furniture,
      required super.price,
      required super.currency,
      required super.size,
      required super.bedroom,
      required super.bathRoom,
      required super.babyRoom,
      required super.kitchen,
      required super.receptionRoom,
      required super.diningRoom,
      required super.advertizerNameAr,
      required super.advertizerNameEn,
      required super.advertizerNameKu,
      required super.whatsapp,
      required super.latitude,
      required super.longitude,
      required super.isSold,
      required super.isInvesBed,
      required super.agentId,
      required super.companyId,
      required super.areaId,
      required super.subAreaId,
      required super.categoryId,
      required super.subCategoryId,
      required super.userId,
      required super.createdAt,
      required super.updatedAt,
      required super.images,
      super.agent,
      required super.company,
      required super.floorPlans,
      required super.videos,
      required super.type,
      required super.locationNameAr,
      required super.locationNameEn,
      required super.locationNameKu,
      required super.services});

  factory MainItemModel.fromJson(Map<String, dynamic> json) => MainItemModel(
        id: json["id"],
        status: json["status"],
        phone: json["phone"],
        phoneCode: json["phone_code"],
        views: json["views"],
        titleAr: json["title_ar"],
        descriptionAr: json["description_ar"] ?? "بدون وصف",
        titleEn: json["title_en"],
        descriptionEn: json["description_en"] ?? "No Description ",
        titleKu: json["title_ku"],
        descriptionKu: json["description_ku"] ?? "هیچ وەسفێک نییە",
        furniture: json["furniture"],
        type: json["type"],
        price: json["price"],
        currency: json["currency"],
        size: json["size"],
        bedroom: json["bedroom"],
        babyRoom: json["baby_room"],
        kitchen: json["kitchen"],
        receptionRoom: json["reception_room"],
        diningRoom: json["dining_room"],
        bathRoom: json["bath_room"] == null ? null : json["bath_room"],
        advertizerNameAr: json["advertizer_name_ar"],
        advertizerNameEn: json["advertizer_name_en"],
        advertizerNameKu: json["advertizer_name_ku"],
        whatsapp: json["whatsapp"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        locationNameAr: json["location_name_ar"] ?? "لا يوجد موقع",
        locationNameEn: json["location_name_en"] ?? "No Location",
        locationNameKu: json["location_name_ku"] ?? "هیچ سایتێک نییە",
        isSold: json["is_sold"],
        isInvesBed: json["is_inves_bed"],
        agentId: json["agent_id"],
        companyId: json["company_id"],
        areaId: json["area_id"],
        subAreaId: json["sub_area_id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<FloorPlan>.from(
            json["images"].map((x) => FloorPlan.fromJson(x))),
        videos: List<FloorPlan>.from(json["videos"].map((x) => x)),
        floorPlans: List<FloorPlan>.from(
            json["floor_plans"].map((x) => FloorPlan.fromJson(x))),
        agent: json["agent"] == null
            ? const AgentModel(
                nameAr: "لا يوجد اسم وكيل",
                nameEn: "No Agent Name",
                nameKu: "ناوی بریکار نییە",
                )
            : AgentModel.fromJson(json["agent"]),
        company: CompanyModel.fromJson(json["company"]),
        services: List<ServiceItemsModel>.from(
            json["services"].map((x) => ServiceItemsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "phone": phone,
        "phone_code": phoneCode,
        "views": views,
        "title_ar": titleAr,
        "description_ar": descriptionAr,
        "title_en": titleEn,
        "description_en": descriptionEn,
        "title_ku": titleKu,
        "description_ku": descriptionKu,
        "furniture": furniture,
        "type": type,
        "price": price,
        "currency": currency,
        "size": size,
        "bedroom": bedroom,
        "baby_room": babyRoom,
        "kitchen": kitchen,
        "reception_room": receptionRoom,
        "dining_room": diningRoom,
        "bath_room": bathRoom == null ? null : bathRoom,
        "advertizer_name_ar": advertizerNameAr,
        "advertizer_name_en": advertizerNameEn,
        "advertizer_name_ku": advertizerNameKu,
        "whatsapp": whatsapp,
        "latitude": latitude,
        "longitude": longitude,
        "location_name_ar": locationNameAr,
        "location_name_en": locationNameEn,
        "location_name_ku": locationNameKu,
        "is_sold": isSold,
        "is_inves_bed": isInvesBed,
        "agent_id": agentId,
        "company_id": companyId,
        "area_id": areaId,
        "sub_area_id": subAreaId,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "images": List<FloorPlan>.from(images!.map((x) => x.toJson())),
        "videos": List<FloorPlan>.from(videos!.map((x) => x)),
        "floor_plans": List<FloorPlan>.from(floorPlans!.map((x) => x.toJson())),
        "agent": agent == null ? null : agent!.toJson(),
        "company": company!.toJson(),
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class AgentModel extends Agent {
  const AgentModel(
      {super.id,
      super.nameAr,
      super.nameEn,
      super.nameKu,
      super.image,
      super.about,
      super.phone,
      super.phoneCode,
      super.whatsapp,
      super.userId,
      super.companyId,
      super.createdAt,
      super.updatedAt});

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        id: json["id"],
        nameAr: json["name_ar"] ?? "لا يوجد اسم وكيل",
        nameEn: json["name_en"] ?? "No Agent Name",
        nameKu: json["name_ku"] ?? "ناوی بریکار نییە",
        image: json["image"],
        about: json["about"],
        phone: json["phone"],
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
        "phone_code": phoneCode,
        "whatsapp": whatsapp,
        "user_id": userId,
        "company_id": companyId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class FloorPlanModel extends FloorPlan {
  const FloorPlanModel(
      {required super.id,
      required super.projectId,
      required super.postId,
      required super.attachment,
      required super.type,
      required super.createdAt,
      required super.updatedAt});

  factory FloorPlanModel.fromJson(Map<String, dynamic> json) => FloorPlanModel(
        id: json["id"],
        projectId: json["project_id"],
        postId: json["post_id"],
        attachment: json["attachment"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "post_id": postId,
        "attachment": attachment,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class CompanyModel extends Company {
  CompanyModel(
      {required super.id,
      required super.facebook,
      required super.instagram,
      required super.twitter,
      required super.snapchat,
      required super.latitude,
      required super.longitude,
      required super.aboutAr,
      required super.aboutEn,
      required super.userId,
      required super.createdAt,
      required super.updatedAt});

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        snapchat: json["snapchat"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        aboutAr: json["about_ar"],
        aboutEn: json["about_en"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
        "snapchat": snapchat,
        "latitude": latitude,
        "longitude": longitude,
        "about_ar": aboutAr,
        "about_en": aboutEn,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class ServiceItemsModel extends ServiceItems {
  ServiceItemsModel(
      {required super.id,
      required super.nameAr,
      required super.nameEn,
      required super.nameKo,
      required super.image,
      required super.icon,
      required super.createdAt,
      required super.updatedAt,
      required super.pivot});

  factory ServiceItemsModel.fromJson(Map<String, dynamic> json) =>
      ServiceItemsModel(
        id: json["id"],
        nameAr: json["name_ar"] ?? "",
        nameEn: json["name_en"] ?? "بدون اسم",
        nameKo: json["name_ko"] ?? "هيچ ناو نييه‌",
        image: json["image"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: PivotModel.fromJson(json["pivot"]),
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
        "pivot": pivot!.toJson(),
      };
}

class PivotModel extends Pivot {
  PivotModel({required super.postId, required super.serviceId});

  factory PivotModel.fromJson(Map<String, dynamic> json) => PivotModel(
        postId: json["post_id"],
        serviceId: json["service_id"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "service_id": serviceId,
      };
}
