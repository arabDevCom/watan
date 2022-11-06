// To parse this JSON data, do
//
//     final getOneMessage = getOneMessageFromJson(jsonString);

import 'dart:convert';

import 'MyRooms.dart';

GetOneMessage getOneMessageFromJson(String str) => GetOneMessage.fromJson(json.decode(str));

String getOneMessageToJson(GetOneMessage data) => json.encode(data.toJson());

class GetOneMessage {
  GetOneMessage({
    this.data,
    this.message,
    this.code,
  });

  MyMessage? data;
  String? message;
  int? code;

  factory GetOneMessage.fromJson(Map<String, dynamic> json) => GetOneMessage(
    data: MyMessage.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "message": message,
    "code": code,
  };
}

