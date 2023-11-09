// To parse this JSON data, do
//
//     final dispatchListResponse = dispatchListResponseFromJson(jsonString);

import 'dart:convert';

DispatchListResponse dispatchListResponseFromJson(String str) =>
    DispatchListResponse.fromJson(json.decode(str));

String dispatchListResponseToJson(DispatchListResponse data) =>
    json.encode(data.toJson());

class DispatchListResponse {
  List<DispatchDetail> dispatchDetails;

  DispatchListResponse({
    required this.dispatchDetails,
  });

  factory DispatchListResponse.fromJson(Map<String, dynamic> json) =>
      DispatchListResponse(
        dispatchDetails: List<DispatchDetail>.from(
            json["dispatchDetails"].map((x) => DispatchDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dispatchDetails":
            List<dynamic>.from(dispatchDetails.map((x) => x.toJson())),
      };
}

class DispatchDetail {
  String id;
  String region;
  String customerName;
  String destination;
  String inventoryNumber;
  String inventoryDate;
  String poNumber;
  String soNumber;
  String soDate;
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
  String createdAt;
  String updatedAt;
  int v;

  DispatchDetail({
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

  factory DispatchDetail.fromJson(Map<String, dynamic> json) => DispatchDetail(
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
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
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
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
