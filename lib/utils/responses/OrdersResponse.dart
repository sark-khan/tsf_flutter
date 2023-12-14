// To parse this JSON data, do
//
//     final orderListResponse = orderListResponseFromJson(jsonString);

import 'dart:convert';

OrderListResponse orderListResponseFromJson(String str) =>
    OrderListResponse.fromJson(json.decode(str));

String orderListResponseToJson(OrderListResponse data) =>
    json.encode(data.toJson());

class OrderListResponse {
  List<Order> orders;

  OrderListResponse({
    required this.orders,
  });

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      OrderListResponse(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  String id;
  List<String> customerPoNumbers;
  List<String> orderPlacedDate;
  List<String> promiseDate;
  List<String> requestDate;

  Order({
    required this.id,
    required this.customerPoNumbers,
    required this.orderPlacedDate,
    required this.promiseDate,
    required this.requestDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        customerPoNumbers:
            List<String>.from(json["customerPoNumbers"].map((x) => x)),
        orderPlacedDate:
            List<String>.from(json["orderPlacedDate"].map((x) => x)),
        promiseDate: List<String>.from(json["promiseDate"].map((x) => x)),
        requestDate: List<String>.from(json["requestDate"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerPoNumbers":
            List<dynamic>.from(customerPoNumbers.map((x) => x)),
        "orderPlacedDate": List<dynamic>.from(orderPlacedDate.map((x) => x)),
        "promiseDate": List<dynamic>.from(promiseDate.map((x) => x)),
        "requestDate": List<dynamic>.from(requestDate.map((x) => x)),
      };
}
