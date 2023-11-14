// To parse this JSON data, do
//
//     final singleDispatchDetails = singleDispatchDetailsFromJson(jsonString);

import 'dart:convert';

SingleDispatchDetails singleDispatchDetailsFromJson(String str) =>
    SingleDispatchDetails.fromJson(json.decode(str));

String singleDispatchDetailsToJson(SingleDispatchDetails data) =>
    json.encode(data.toJson());

class SingleDispatchDetails {
  DispatchDetails dispatchDetails;

  SingleDispatchDetails({
    required this.dispatchDetails,
  });

  factory SingleDispatchDetails.fromJson(Map<String, dynamic> json) =>
      SingleDispatchDetails(
        dispatchDetails: DispatchDetails.fromJson(json["dispatchDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "dispatchDetails": dispatchDetails.toJson(),
      };
}

class DispatchDetails {
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

  DispatchDetails({
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

  factory DispatchDetails.fromJson(Map<String, dynamic> json) =>
      DispatchDetails(
        id: json["_id"],
        region: json["region"],
        customerName: json["customerName"],
        destination: json["destination"],
        inventoryNumber: json["inventoryNumber"],
        inventoryDate: (json["inventoryDate"]),
        poNumber: json["poNumber"],
        soNumber: json["soNumber"],
        soDate: (json["soDate"]),
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
        createdAt: (json["createdAt"]),
        updatedAt: (json["updatedAt"]),
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
      };
}
