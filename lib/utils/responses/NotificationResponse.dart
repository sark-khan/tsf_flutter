// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  List<Message> message;

  NotificationResponse({
    required this.message,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        message:
            List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  String id;
  String notificationText;
  String createdAt;

  Message({
    required this.id,
    required this.notificationText,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        notificationText: json["notificationText"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "notificationText": notificationText,
        "createdAt": createdAt,
      };
}
