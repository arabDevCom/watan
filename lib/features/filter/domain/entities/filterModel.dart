// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    this.status,
    this.currency,
    this.cityId,
    this.locationId,
    this.type,
    this.priceFrom,
    this.priceTo,
    this.bedroom,
    this.bathRoom,
    this.sizeFrom,
    this.sizeTo,
    this.userId,
  });

 final String? status;
 final String? currency;
 final int? cityId;
 final int? locationId;
 final int? type;
 final int? priceFrom;
 final int? priceTo;
 final int? bedroom;
 final int? bathRoom;
 final int? sizeFrom;
 final int? sizeTo;
 final int? userId;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    status: json["status"],
    currency: json["currency"],
    cityId: json["city_id"],
    locationId: json["location_id"],
    type: json["type"],
    priceFrom: json["price_from"],
    priceTo: json["price_to"],
    bedroom: json["bedroom"],
    bathRoom: json["bath_room"],
    sizeFrom: json["size_from"],
    sizeTo: json["size_to"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "currency": currency,
    "city_id": cityId,
    "location_id": locationId,
    "type": type,
    "price_from": priceFrom,
    "price_to": priceTo,
    "bedroom": bedroom,
    "bath_room": bathRoom,
    "size_from": sizeFrom,
    "size_to": sizeTo,
    "user_id": userId,
  };
}
