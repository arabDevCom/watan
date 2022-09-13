import 'package:equatable/equatable.dart';

import '../../data/models/main_item_data_model.dart';

class MainItem extends Equatable {
  const MainItem({
    this.id,
    this.status,
    this.phone,
    this.phoneCode,
    this.views,
    this.titleAr,
    this.descriptionAr,
    this.titleEn,
    this.descriptionEn,
    this.titleKo,
    this.descriptionKo,
    this.furniture,
    this.price,
    this.currency,
    this.size,
    this.bedroom,
    this.babyRoom,
    this.bathRoom,
    this.kitchen,
    this.receptionRoom,
    this.diningRoom,
    this.advertizerNameAr,
    this.advertizerNameEn,
    this.advertizerNameKo,
    this.whatsapp,
    this.latitude,
    this.longitude,
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
    this.agent,
    this.company,
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
  final String? titleKo;
  final String? descriptionKo;
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
  final String? advertizerNameAr;
  final String? advertizerNameEn;
  final String? advertizerNameKo;
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
  final List<ImageModel>? images;
  final AgentModel? agent;
  final dynamic company;

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
        titleKo,
        descriptionKo,
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
        advertizerNameKo,
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
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKo,
    required this.image,
    required this.about,
    required this.phone,
    required this.phoneCode,
    required this.whatsapp,
    required this.userId,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? nameKo;
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
        nameKo,
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

class ItemImages extends Equatable {
  const ItemImages({
    required this.id,
    required this.projectId,
    required this.postId,
    required this.attachment,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? projectId;
  final int? postId;
  final String? attachment;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
