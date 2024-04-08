// To parse this JSON data, do
//
//     final dispatchListResponse = dispatchListResponseFromJson(jsonString);

import 'dart:convert';

DispatchListResponse dispatchListResponseFromJson(String str) =>
    DispatchListResponse.fromJson(json.decode(str));

String dispatchListResponseToJson(DispatchListResponse data) =>
    json.encode(data.toJson());

class DispatchListResponse {
  List<DispatchList> dispatchList;

  DispatchListResponse({
    required this.dispatchList,
  });

  factory DispatchListResponse.fromJson(Map<String, dynamic> json) =>
      DispatchListResponse(
        dispatchList: List<DispatchList>.from(
            json["dispatchList"].map((x) => DispatchList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dispatchList": List<dynamic>.from(dispatchList.map((x) => x.toJson())),
      };
}

class DispatchList {
  String id;
  List<String> customerPoNumbers;
  List<String> invoiceNumber;
  List<String> promiseDate;
  List<String> destination;

  DispatchList(
      {required this.id,
      required this.customerPoNumbers,
      required this.invoiceNumber,
      required this.promiseDate,
      required this.destination});

  factory DispatchList.fromJson(Map<String, dynamic> json) => DispatchList(
        id: json["_id"],
        customerPoNumbers:
            List<String>.from(json["customerPoNumbers"].map((x) => x)),
        invoiceNumber: List<String>.from(json["invoiceNumber"].map((x) => x)),
        promiseDate: List<String>.from(json["promiseDate"].map((x) => x)),
        destination: List<String>.from(json["destination"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerPoNumbers":
            List<dynamic>.from(customerPoNumbers.map((x) => x)),
        "invoiceNumber": List<dynamic>.from(invoiceNumber.map((x) => x)),
        "promiseDate": List<dynamic>.from(promiseDate.map((x) => x)),
        "destination": List<dynamic>.from(destination.map((x) => x)),
      };
}
