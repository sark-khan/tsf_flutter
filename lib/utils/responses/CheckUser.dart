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
  UserDetails userDetails;

  CheckUserResponse({
    required this.accountRejected,
    required this.activationRequested,
    required this.isRequestSent,
    required this.insertNewPassword,
    required this.message,
    required this.userDetails,
  });

  factory CheckUserResponse.fromJson(Map<String, dynamic> json) =>
      CheckUserResponse(
        accountRejected: json["accountRejected"],
        activationRequested: json["activationRequested"],
        isRequestSent: json["isRequestSent"],
        insertNewPassword: json["insertNewPassword"],
        message: json["message"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "accountRejected": accountRejected,
        "activationRequested": activationRequested,
        "isRequestSent": isRequestSent,
        "insertNewPassword": insertNewPassword,
        "message": message,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  UserDetails();

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails();

  Map<String, dynamic> toJson() => {};
}
