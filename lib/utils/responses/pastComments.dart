// To parse this JSON data, do
//
//     final getPastComments = getPastCommentsFromJson(jsonString);

import 'dart:convert';

GetPastComments getPastCommentsFromJson(String str) =>
    GetPastComments.fromJson(json.decode(str));

String getPastCommentsToJson(GetPastComments data) =>
    json.encode(data.toJson());

class GetPastComments {
  List<OrderPastComment> orderPastComments;

  GetPastComments({
    required this.orderPastComments,
  });

  factory GetPastComments.fromJson(Map<String, dynamic> json) =>
      GetPastComments(
        orderPastComments: List<OrderPastComment>.from(
            json["orderPastComments"].map((x) => OrderPastComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderPastComments":
            List<dynamic>.from(orderPastComments.map((x) => x.toJson())),
      };
}

class OrderPastComment {
  String id;
  String text;

  OrderPastComment({
    required this.id,
    required this.text,
  });

  factory OrderPastComment.fromJson(Map<String, dynamic> json) =>
      OrderPastComment(
        id: json["_id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
      };
}
