// To parse this JSON data, do
//
//     final getCommentsResponse = getCommentsResponseFromJson(jsonString);

import 'dart:convert';

GetCommentsResponse getCommentsResponseFromJson(String str) =>
    GetCommentsResponse.fromJson(json.decode(str));

String getCommentsResponseToJson(GetCommentsResponse data) =>
    json.encode(data.toJson());

class GetCommentsResponse {
  List<GetOrderCommentsDetail> getOrderCommentsDetails;

  GetCommentsResponse({
    required this.getOrderCommentsDetails,
  });

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      GetCommentsResponse(
        getOrderCommentsDetails: List<GetOrderCommentsDetail>.from(
            json["getOrderCommentsDetails"]
                .map((x) => GetOrderCommentsDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getOrderCommentsDetails":
            List<dynamic>.from(getOrderCommentsDetails.map((x) => x.toJson())),
      };
}

class GetOrderCommentsDetail {
  String id;
  Order order;
  Sender sender;
  String text;
  String updatedAt;
  int v;

  GetOrderCommentsDetail({
    required this.id,
    required this.order,
    required this.sender,
    required this.text,
    required this.updatedAt,
    required this.v,
  });

  factory GetOrderCommentsDetail.fromJson(Map<String, dynamic> json) =>
      GetOrderCommentsDetail(
        id: json["_id"],
        order: Order.fromJson(json["order"]),
        sender: Sender.fromJson(json["sender"]),
        text: json["text"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "order": order.toJson(),
        "sender": sender.toJson(),
        "text": text,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Order {
  String id;
  String customerName;
  String soNumber;
  String customerPoNo;

  Order({
    required this.id,
    required this.customerName,
    required this.soNumber,
    required this.customerPoNo,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        customerName: json["customerName"],
        soNumber: json["soNumber"],
        customerPoNo: json["customerPoNo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
        "soNumber": soNumber,
        "customerPoNo": customerPoNo,
      };
}

class Sender {
  String id;
  String accountNumber;
  String? partyName;

  Sender({
    required this.id,
    required this.accountNumber,
    this.partyName,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        accountNumber: json["accountNumber"],
        partyName: json["partyName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "accountNumber": accountNumber,
        "partyName": partyName,
      };
}
