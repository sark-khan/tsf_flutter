// To parse this JSON data, do
//
//     final userActivationResponse = userActivationResponseFromJson(jsonString);

import 'dart:convert';

UserActivationResponse userActivationResponseFromJson(String str) => UserActivationResponse.fromJson(json.decode(str));

String userActivationResponseToJson(UserActivationResponse data) => json.encode(data.toJson());

class UserActivationResponse {
    List<Request> requests;

    UserActivationResponse({
        required this.requests,
    });

    factory UserActivationResponse.fromJson(Map<String, dynamic> json) => UserActivationResponse(
        requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
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
    bool isStatusLoading;
    String createdAt;
    int v;

    Request({
        required this.id,
        required this.requestCreatedBy,
        required this.requestFor,
        required this.isResponded,
        required this.isApproved,
        required this.createdAt,
        this.isStatusLoading  =false,
        required this.v,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["_id"],
    requestCreatedBy: RequestCreatedBy.fromJson(json["requestCreatedBy"]),
        createdAt: json["createdAt"],
        requestFor: List<String>.from(json["requestFor"].map((x) => x)),
        isResponded: json["isResponded"],
        isApproved: json["isApproved"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
          "requestCreatedBy": requestCreatedBy.toJson(),
        "requestFor": List<dynamic>.from(requestFor.map((x) => x)),
        "isResponded": isResponded,
        "isApproved": isApproved,
        "createdAt": createdAt,
        "__v": v,
    };
}


class RequestCreatedBy {
    String id;
    String accountNumber;

    RequestCreatedBy({
        required this.id,
        required this.accountNumber,
    });

    factory RequestCreatedBy.fromJson(Map<String, dynamic> json) => RequestCreatedBy(
        id: json["_id"],
        accountNumber: json["accountNumber"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "accountNumber": accountNumber,
    };
}