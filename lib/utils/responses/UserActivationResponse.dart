// To parse this JSON data, do
//
//     final userActivationResponse = userActivationResponseFromJson(jsonString);

import 'dart:convert';

UserActivationResponse userActivationResponseFromJson(String str) =>
    UserActivationResponse.fromJson(json.decode(str));

String userActivationResponseToJson(UserActivationResponse data) =>
    json.encode(data.toJson());

class UserActivationResponse {
  List<Request> requests;

  UserActivationResponse({
    required this.requests,
  });

  factory UserActivationResponse.fromJson(Map<String, dynamic> json) =>
      UserActivationResponse(
        requests: List<Request>.from(
            json["requests"].map((x) => Request.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
      };
}

class Request {
  String id;
  RequestCreatedBy requestCreatedBy;
  List<String> requestFor;
  bool isResponded;
  bool isApproved;
  DateTime createdAt;
  int v;
  AssignedSubadmin assignedSubadmin;

  Request({
    required this.id,
    required this.requestCreatedBy,
    required this.requestFor,
    required this.isResponded,
    required this.isApproved,
    required this.createdAt,
    required this.v,
    required this.assignedSubadmin,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["_id"],
        requestCreatedBy: RequestCreatedBy.fromJson(json["requestCreatedBy"]),
        requestFor: List<String>.from(json["requestFor"].map((x) => x)),
        isResponded: json["isResponded"],
        isApproved: json["isApproved"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        assignedSubadmin: AssignedSubadmin.fromJson(json["assignedSubadmin"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "requestCreatedBy": requestCreatedBy.toJson(),
        "requestFor": List<dynamic>.from(requestFor.map((x) => x)),
        "isResponded": isResponded,
        "isApproved": isApproved,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "assignedSubadmin": assignedSubadmin.toJson(),
      };
}

class AssignedSubadmin {
  String id;
  String name;

  AssignedSubadmin({
    required this.id,
    required this.name,
  });

  factory AssignedSubadmin.fromJson(Map<String, dynamic> json) =>
      AssignedSubadmin(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class RequestCreatedBy {
  String id;
  String email;
  String accountNumber;
  String partyName;

  RequestCreatedBy({
    required this.id,
    required this.email,
    required this.accountNumber,
    required this.partyName,
  });

  factory RequestCreatedBy.fromJson(Map<String, dynamic> json) =>
      RequestCreatedBy(
        id: json["_id"],
        email: json["email"],
        accountNumber: json["accountNumber"],
        partyName: json["partyName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "accountNumber": accountNumber,
        "partyName": partyName,
      };
}
