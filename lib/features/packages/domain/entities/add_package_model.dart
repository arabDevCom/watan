// To parse this JSON data, do
//
//     final addPackageModel = addPackageModelFromJson(jsonString);

import 'dart:convert';

AddPackageModel addPackageModelFromJson(String str) => AddPackageModel.fromJson(json.decode(str));

String addPackageModelToJson(AddPackageModel data) => json.encode(data.toJson());

class AddPackageModel {
  AddPackageModel({
    this.packageId,
    this.userId,
    this.paymentType,
    this.data,
    this.status,
    this.message,
    this.token,
  });

  int? packageId;
  int? userId;
  String? paymentType;
  String? data;
  int? status;
  String? message;
  String? token;

  factory AddPackageModel.fromJson(Map<String, dynamic> json) => AddPackageModel(
    packageId: json["package_id"],
    userId: json["user_id"],
    paymentType: json["payment_type"],
  );
  factory AddPackageModel.responseDataFromJson(Map<String, dynamic> json) => AddPackageModel(
    data: json["data"],
    status: json["status"],
    message: json["message"],
  );
  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "user_id": userId,
    "payment_type": paymentType,
  };
  Map<String, dynamic> responseDataToJson() => {
    "data": data,
    "status": status,
    "message": message,
  };
}
