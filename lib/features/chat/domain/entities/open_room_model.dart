// To parse this JSON data, do
//
//     final openRoom = openRoomFromJson(jsonString);

import 'dart:convert';

OpenRoom openRoomPostFromJson(String str) => OpenRoom.postFromJson(json.decode(str));
OpenRoom openRoomProjectFromJson(String str) => OpenRoom.projectFromJson(json.decode(str));

String openRoomPostToJson(OpenRoom data) => json.encode(data.postToJson());
String openRoomProjectToJson(OpenRoom data) => json.encode(data.projectToJson());

class OpenRoom {
  OpenRoom({
    this.toUserId,
    this.postId,
    this.projectId,
    this.token,
    this.type,
  });

  int? toUserId;
  int? postId;
  int? projectId;
  String? token;
  String? type;

  factory OpenRoom.postFromJson(Map<String, dynamic> json) => OpenRoom(
    toUserId: json["to_user_id"],
    postId: json["post_id"],
  );

  factory OpenRoom.projectFromJson(Map<String, dynamic> json) => OpenRoom(
    toUserId: json["to_user_id"],
    projectId: json["project_id"],
  );
  Map<String, dynamic> postToJson() => {
    "to_user_id": toUserId,
    "post_id": postId,
  };
  Map<String, dynamic> projectToJson() => {
    "to_user_id": toUserId,
    "project_id": projectId,
  };
}
