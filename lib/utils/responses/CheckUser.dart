// To parse this JSON data, do
//
//     final checkUserResponse = checkUserResponseFromJson(jsonString);

import 'dart:convert';

CheckUserResponse checkUserResponseFromJson(String str) =>
    CheckUserResponse.fromJson(json.decode(str));

String checkUserResponseToJson(CheckUserResponse data) =>
    json.encode(data.toJson());

class CheckUserResponse {
  bool accountRejected;
  bool activationRequested;
  bool isRequestSent;
  bool insertNewPassword;
  String message;
  bool userVerified;

  CheckUserResponse({
    required this.accountRejected,
    required this.activationRequested,
    required this.isRequestSent,
    required this.insertNewPassword,
    required this.message,
    required this.userVerified
  });

  factory CheckUserResponse.fromJson(Map<String, dynamic> json) =>
      CheckUserResponse(
        accountRejected: json["accountRejected"],
        activationRequested: json["activationRequested"],
        isRequestSent: json["isRequestSent"],
        insertNewPassword: json["insertNewPassword"],
        message: json["message"],
        userVerified: json["userVerified"]
      );

  Map<String, dynamic> toJson() => {
        "accountRejected": accountRejected,
        "activationRequested": activationRequested,
        "isRequestSent": isRequestSent,
        "insertNewPassword": insertNewPassword,
        "message": message
      };
}