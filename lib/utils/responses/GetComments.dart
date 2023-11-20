// To parse this JSON data, do
//
//     final getCommentsResponse = getCommentsResponseFromJson(jsonString);

import 'dart:convert';

GetCommentsResponse getCommentsResponseFromJson(String str) => GetCommentsResponse.fromJson(json.decode(str));

String getCommentsResponseToJson(GetCommentsResponse data) => json.encode(data.toJson());

class GetCommentsResponse {
    List<GetOrderCommentsDetail> getOrderCommentsDetails;

    GetCommentsResponse({
        required this.getOrderCommentsDetails,
    });

    factory GetCommentsResponse.fromJson(Map<String, dynamic> json) => GetCommentsResponse(
        getOrderCommentsDetails: List<GetOrderCommentsDetail>.from(json["getOrderCommentsDetails"].map((x) => GetOrderCommentsDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getOrderCommentsDetails": List<dynamic>.from(getOrderCommentsDetails.map((x) => x.toJson())),
    };
}

class GetOrderCommentsDetail {
    DateTime updatedAt;
    String id;
    String order;
    Sender sender;
    String text;
    int v;

    GetOrderCommentsDetail({
        required this.updatedAt,
        required this.id,
        required this.order,
        required this.sender,
        required this.text,
        required this.v,
    });

    factory GetOrderCommentsDetail.fromJson(Map<String, dynamic> json) => GetOrderCommentsDetail(
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"],
        order: json["order"],
        sender: Sender.fromJson(json["sender"]),
        text: json["text"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt.toIso8601String(),
        "_id": id,
        "order": order,
        "sender": sender.toJson(),
        "text": text,
        "__v": v,
    };
}

class Sender {
    String id;
    String name;
    String accountNumber;

    Sender({
        required this.id,
        required this.name,
        required this.accountNumber,
    });

    factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        name: json["name"],
        accountNumber: json["accountNumber"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "accountNumber": accountNumber,
    };
}
