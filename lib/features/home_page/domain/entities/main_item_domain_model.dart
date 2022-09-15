import 'package:equatable/equatable.dart';

import '../../data/models/main_item_data_model.dart';

// ignore: must_be_immutable
class MainItem extends Equatable {
  MainItem({
    this.id,
    this.status,
    this.phone,
    this.phoneCode,
    this.views,
    this.titleAr,
    this.descriptionAr,
    this.titleEn,
    this.descriptionEn,
    this.titleKu,
    this.descriptionKu,
    this.furniture,
    this.type,
    this.price,
    this.currency,
    this.size,
    this.bedroom,
    this.babyRoom,
    this.kitchen,
    this.receptionRoom,
    this.diningRoom,
    this.bathRoom,
    this.advertizerNameAr,
    this.advertizerNameEn,
    this.advertizerNameKu,
    this.whatsapp,
    this.latitude,
    this.longitude,
    this.locationNameAr,
    this.locationNameEn,
    this.locationNameKu,
    this.isSold,
    this.isInvesBed,
    this.agentId,
    this.companyId,
    this.areaId,
    this.subAreaId,
    this.categoryId,
    this.subCategoryId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.videos,
    this.floorPlans,
    this.agent,
    this.company,
    this.services,
  });

  final int? id;
  final String? status;
  final String? phone;
  final String? phoneCode;
  final int? views;
  final String? titleAr;
  final String? descriptionAr;
  final String? titleEn;
  final String? descriptionEn;
  final String? titleKu;
  final String? descriptionKu;
  final String? furniture;
  final int? price;
  final String? currency;
  final String? size;
  final int? bedroom;
  final int? bathRoom;
  final int? babyRoom;
  final int? kitchen;
  final int? receptionRoom;
  final int? diningRoom;
  final String? type;
  final String? advertizerNameAr;
  final String? advertizerNameEn;
  final String? advertizerNameKu;
  final String? whatsapp;
  final String? latitude;
  final String? longitude;
  final int? isSold;
  final int? isInvesBed;
  final int? agentId;
  final int? companyId;
  final int? areaId;
  final int? subAreaId;
  final int? categoryId;
  final int? subCategoryId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AgentModel? agent;
  final String? locationNameAr;
  final String? locationNameEn;
  final String? locationNameKu;
  final List<FloorPlan>? images;
  final List<FloorPlan>? videos;
  final List<FloorPlan>? floorPlans;
  final CompanyModel? company;
  final List<ServiceItemsModel>? services;

  @override
  List<Object?> get props => [
        id,
        status,
        phone,
        phoneCode,
        views,
        titleAr,
        descriptionAr,
        titleEn,
        descriptionEn,
        titleKu,
        descriptionKu,
        furniture,
        price,
        currency,
        size,
        bedroom,
        bathRoom,
        babyRoom,
        kitchen,
        receptionRoom,
        diningRoom,
        advertizerNameAr,
        advertizerNameEn,
        advertizerNameKu,
        whatsapp,
        latitude,
        longitude,
        isSold,
        isInvesBed,
        agentId,
        companyId,
        areaId,
        subAreaId,
        categoryId,
        subCategoryId,
        userId,
        createdAt,
        updatedAt,
        images,
        agent,
        company,
      ];
}

class Agent extends Equatable {
  const Agent({
     this.id,
     this.nameAr,
     this.nameEn,
     this.nameKu,
     this.image,
     this.about,
     this.phone,
     this.phoneCode,
     this.whatsapp,
     this.userId,
     this.companyId,
     this.createdAt,
     this.updatedAt,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? nameKu;
  final String? image;
  final String? about;
  final String? phone;
  final String? phoneCode;
  final String? whatsapp;
  final int? userId;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        nameKu,
        image,
        about,
        phone,
        phoneCode,
        whatsapp,
        userId,
        companyId,
        createdAt,
        updatedAt,
      ];
}

class Company extends Equatable {
  const Company({
    required this.id,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.snapchat,
    required this.latitude,
    required this.longitude,
    required this.aboutAr,
    required this.aboutEn,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? snapchat;
  final String? latitude;
  final String? longitude;
  final String? aboutAr;
  final String? aboutEn;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        id,
        facebook,
        instagram,
        twitter,
        snapchat,
        latitude,
        longitude,
        aboutAr,
        aboutEn,
        userId,
        createdAt,
        updatedAt,
      ];
}

class FloorPlan extends Equatable {
  const FloorPlan({
    this.id,
    this.projectId,
    this.postId,
    this.attachment,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? projectId;
  final int? postId;
  final String? attachment;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FloorPlan.fromJson(Map<String, dynamic> json) => FloorPlan(
        id: json["id"],
        projectId: json["project_id"],
        postId: json["post_id"],
        attachment: json["attachment"],
        type: json["type"],
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"]):DateTime(0),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"]):DateTime(0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "post_id": postId,
        "attachment": attachment,
        "type": type,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        projectId,
        postId,
        attachment,
        type,
        createdAt,
        updatedAt,
      ];
}

class ServiceItems extends Equatable {
  const ServiceItems({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKo,
    required this.image,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? nameKo;
  final String? image;
  final String? icon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PivotModel? pivot;

  @override
  List<Object?> get props =>
      [id, nameAr, nameEn, nameKo, image, icon, createdAt, updatedAt, pivot];
}

class Pivot extends Equatable {
  const Pivot({
    required this.postId,
    required this.serviceId,
  });

  final int? postId;
  final int? serviceId;


  @override
  List<Object?> get props => [
        postId,
        serviceId,
      ];
}
