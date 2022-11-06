// To parse this JSON data, do
//
//     final sendMessage = sendMessageFromJson(jsonString);

import 'dart:convert';
import 'package:dio/dio.dart';

SendMessage sendMessageFromJson(String str) =>
    SendMessage.sendMessageWithPhotoFromJson(json.decode(str));

String sendMessageToJson(SendMessage data) =>
    json.encode(data.sendMessageWithPhotoToJson());

class SendMessage {
  SendMessage({
    this.roomId,
    this.toUserId,
    this.type,
    this.message,
    this.file,
    this.token,
  });

  int? roomId;
  int? toUserId;
  String? type;
  String? message;
  String? file;
  String? token;

  factory SendMessage.sendMessageWithPhotoFromJson(Map<String, dynamic> json) =>
      SendMessage(
        roomId: json["room_id"],
        toUserId: json["to_user_id"],
        type: json["type"],
        message: json["message"],
        file: json["file"],
      );

  factory SendMessage.sendMessageWithoutPhotoFromJson(
          Map<String, dynamic> json) =>
      SendMessage(
        roomId: json["room_id"],
        toUserId: json["to_user_id"],
        type: json["type"],
        message: json["message"],
        file: json["file"],
      );

  Future<Map<String, dynamic>> sendMessageWithPhotoToJson() async => {
        "room_id": roomId,
        "to_user_id": toUserId,
        "type": type,
        "file": file != null ? await MultipartFile.fromFile(file!) : '',
      };

  Map<String, dynamic> sendMessageWithoutPhotoToJson() => {
        "room_id": roomId,
        "to_user_id": toUserId,
        "type": type,
        "message": message,
      };
}
