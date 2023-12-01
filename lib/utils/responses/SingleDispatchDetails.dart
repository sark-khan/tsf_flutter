// To parse this JSON data, do
//
//     final singleDispatchDetails = singleDispatchDetailsFromJson(jsonString);

import 'dart:convert';

SingleDispatchDetails singleDispatchDetailsFromJson(String str) =>
    SingleDispatchDetails.fromJson(json.decode(str));

String singleDispatchDetailsToJson(SingleDispatchDetails data) =>
    json.encode(data.toJson());

class SingleDispatchDetails {
  DispatchDetails? dispatchDetails;

  SingleDispatchDetails({
    this.dispatchDetails,
  });

  factory SingleDispatchDetails.fromJson(Map<String, dynamic> json) =>
      SingleDispatchDetails(
        dispatchDetails: DispatchDetails.fromJson(json["dispatchDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "dispatchDetails": dispatchDetails!.toJson(),
      };
}

class DispatchDetails {
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
  String? userAccountNumber;
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

  DispatchDetails({
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
    this.userAccountNumber,
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
        userAccountNumber: json["userAccountNumber"],
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
        "userAccountNumber": userAccountNumber,
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
