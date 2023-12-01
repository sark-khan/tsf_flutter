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
  String? id;
  String? region;
  String? customerName;
  String? destination;
  String? inventoryNumber;
  String? inventoryDate;
  String? poNumber;
  String? soNumber;
  String? soDate;
  String? filmtype;
  String? coreInnerDiameter;
  String? rollOuterDiameter;
  String? width;
  String? dispatchQuantityInKg;
  String? vehicleNumber;
  String? mktSoNumber;
  String? dispatchQuantityInSqm;
  String? firstTransporter;
  String? tripNumber;
  String? lrNumber;
  String? secondTransporter;
  String? mobileNumber;
  String? saleCategory;
  String? collectorName;
  String? grade;
  String? value;
  String? packingType;
  String? consignee;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? userAccountNumber;

  DispatchList({
    this.id,
    this.region,
    this.customerName,
    this.destination,
    this.inventoryNumber,
    this.inventoryDate,
    this.poNumber,
    this.soNumber,
    this.soDate,
    this.filmtype,
    this.coreInnerDiameter,
    this.rollOuterDiameter,
    this.width,
    this.dispatchQuantityInKg,
    this.vehicleNumber,
    this.mktSoNumber,
    this.dispatchQuantityInSqm,
    this.firstTransporter,
    this.tripNumber,
    this.lrNumber,
    this.secondTransporter,
    this.mobileNumber,
    this.saleCategory,
    this.collectorName,
    this.grade,
    this.value,
    this.packingType,
    this.consignee,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userAccountNumber,
  });

  factory DispatchList.fromJson(Map<String, dynamic> json) => DispatchList(
        id: json["_id"],
        region: json["region"],
        customerName: json["customerName"],
        destination: json["destination"],
        inventoryNumber: json["inventoryNumber"],
        inventoryDate: json["inventoryDate"],
        poNumber: json["poNumber"],
        soNumber: json["soNumber"],
        soDate: json["soDate"],
        filmtype: json["filmtype"],
        coreInnerDiameter: json["coreInnerDiameter"],
        rollOuterDiameter: json["rollOuterDiameter"],
        width: json["width"],
        dispatchQuantityInKg: json["dispatchQuantityInKg"],
        vehicleNumber: json["vehicleNumber"],
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
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        userAccountNumber: json["userAccountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "region": region,
        "customerName": customerName,
        "destination": destination,
        "inventoryNumber": inventoryNumber,
        "inventoryDate": inventoryDate,
        "poNumber": poNumber,
        "soNumber": soNumber,
        "soDate": soDate,
        "filmtype": filmtype,
        "coreInnerDiameter": coreInnerDiameter,
        "rollOuterDiameter": rollOuterDiameter,
        "width": width,
        "dispatchQuantityInKg": dispatchQuantityInKg,
        "vehicleNumber": vehicleNumber,
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
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "userAccountNumber": userAccountNumber,
      };
}
