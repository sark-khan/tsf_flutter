// To parse this JSON data, do
//
//     final dispatchListResponse = dispatchListResponseFromJson(jsonString);

import 'dart:convert';

DispatchListResponse dispatchListResponseFromJson(String str) => DispatchListResponse.fromJson(json.decode(str));

String dispatchListResponseToJson(DispatchListResponse data) => json.encode(data.toJson());

class DispatchListResponse {
  List<DispatchList> dispatchList;

  DispatchListResponse({
    required this.dispatchList,
  });

  factory DispatchListResponse.fromJson(Map<String, dynamic> json) => DispatchListResponse(
    dispatchList: List<DispatchList>.from(json["dispatchList"].map((x) => DispatchList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dispatchList": List<dynamic>.from(dispatchList.map((x) => x.toJson())),
  };
}

class DispatchList {
  String id;
  String region;
  String customerName;
  String destination;
  String inventoryNumber;
  DateTime inventoryDate;
  String poNumber;
  String soNumber;
  DateTime soDate;
  String filmtype;
  String coreInnerDiameter;
  String rollOuterDiameter;
  String width;
  String dispatchQuantityInKg;
  String vehicleNumber;
  String customerAccountCode;
  String mktSoNumber;
  String dispatchQuantityInSqm;
  String firstTransporter;
  String tripNumber;
  String lrNumber;
  String secondTransporter;
  String mobileNumber;
  String saleCategory;
  String collectorName;
  String grade;
  String value;
  String packingType;
  String consignee;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  DispatchList({
    required this.id,
    required this.region,
    required this.customerName,
    required this.destination,
    required this.inventoryNumber,
    required this.inventoryDate,
    required this.poNumber,
    required this.soNumber,
    required this.soDate,
    required this.filmtype,
    required this.coreInnerDiameter,
    required this.rollOuterDiameter,
    required this.width,
    required this.dispatchQuantityInKg,
    required this.vehicleNumber,
    required this.customerAccountCode,
    required this.mktSoNumber,
    required this.dispatchQuantityInSqm,
    required this.firstTransporter,
    required this.tripNumber,
    required this.lrNumber,
    required this.secondTransporter,
    required this.mobileNumber,
    required this.saleCategory,
    required this.collectorName,
    required this.grade,
    required this.value,
    required this.packingType,
    required this.consignee,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DispatchList.fromJson(Map<String, dynamic> json) => DispatchList(
    id: json["_id"],
    region: json["region"],
    customerName: json["customerName"],
    destination: json["destination"],
    inventoryNumber: json["inventoryNumber"],
    inventoryDate: DateTime.parse(json["inventoryDate"]),
    poNumber: json["poNumber"],
    soNumber: json["soNumber"],
    soDate: DateTime.parse(json["soDate"]),
    filmtype: json["filmtype"],
    coreInnerDiameter: json["coreInnerDiameter"],
    rollOuterDiameter: json["rollOuterDiameter"],
    width: json["width"],
    dispatchQuantityInKg: json["dispatchQuantityInKg"],
    vehicleNumber: json["vehicleNumber"],
    customerAccountCode: json["customerAccountCode"],
    mktSoNumber: json["mktSoNumber"],
    dispatchQuantityInSqm: json["dispatchQuantityInSqm"],
    firstTransporter: json["firstTransporter"],
    tripNumber: json["tripNumber"],
    lrNumber: json["lrNumber"],
    secondTransporter: json["secondTransporter"],
    mobileNumber: json["mobileNumber"],
    saleCategory: json["saleCategory"],
    collectorName: json["collectorName"],
    grade: json["grade"],
    value: json["value"],
    packingType: json["packingType"],
    consignee: json["consignee"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "region": region,
    "customerName": customerName,
    "destination": destination,
    "inventoryNumber": inventoryNumber,
    "inventoryDate": "${inventoryDate.year.toString().padLeft(4, '0')}-${inventoryDate.month.toString().padLeft(2, '0')}-${inventoryDate.day.toString().padLeft(2, '0')}",
    "poNumber": poNumber,
    "soNumber": soNumber,
    "soDate": "${soDate.year.toString().padLeft(4, '0')}-${soDate.month.toString().padLeft(2, '0')}-${soDate.day.toString().padLeft(2, '0')}",
    "filmtype": filmtype,
    "coreInnerDiameter": coreInnerDiameter,
    "rollOuterDiameter": rollOuterDiameter,
    "width": width,
    "dispatchQuantityInKg": dispatchQuantityInKg,
    "vehicleNumber": vehicleNumber,
    "customerAccountCode": customerAccountCode,
    "mktSoNumber": mktSoNumber,
    "dispatchQuantityInSqm": dispatchQuantityInSqm,
    "firstTransporter": firstTransporter,
    "tripNumber": tripNumber,
    "lrNumber": lrNumber,
    "secondTransporter": secondTransporter,
    "mobileNumber": mobileNumber,
    "saleCategory": saleCategory,
    "collectorName": collectorName,
    "grade": grade,
    "value": value,
    "packingType": packingType,
    "consignee": consignee,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
