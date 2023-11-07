// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  List<Order> orders;

  Orders({
    required this.orders,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  String id;
  int orderId;
  String orderDetails;
  DateTime arrivingTime;
  String priority;
  String userAccountNumber;
  String updatedAt;
  DateTime orderPlacedTime;
  String orderName;
  bool hasDispatched;
  int v;

  Order({
    required this.id,
    required this.orderId,
    required this.orderDetails,
    required this.arrivingTime,
    required this.priority,
    required this.userAccountNumber,
    required this.updatedAt,
    required this.orderPlacedTime,
    required this.orderName,
    required this.hasDispatched,
    required this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        orderId: json["orderId"],
        orderDetails: json["orderDetails"],
        arrivingTime: DateTime.parse(json["arrivingTime"]),
        priority: json["priority"],
        userAccountNumber: json["userAccountNumber"],
        updatedAt: json["updatedAt"],
        orderPlacedTime: DateTime.parse(json["orderPlacedTime"]),
        orderName: json["orderName"],
        hasDispatched: json["hasDispatched"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "orderId": orderId,
        "orderDetails": orderDetails,
        "arrivingTime": arrivingTime.toIso8601String(),
        "priority": priority,
        "userAccountNumber": userAccountNumber,
        "updatedAt": updatedAt,
        "orderPlacedTime": orderPlacedTime.toIso8601String(),
        "orderName": orderName,
        "hasDispatched": hasDispatched,
        "__v": v,
      };
}
