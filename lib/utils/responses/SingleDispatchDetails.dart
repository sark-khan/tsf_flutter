// To parse this JSON data, do
//
//     final singleDispatchDetails = singleDispatchDetailsFromJson(jsonString);

import 'dart:convert';

SingleDispatchDetails singleDispatchDetailsFromJson(String str) =>
    SingleDispatchDetails.fromJson(json.decode(str));

String singleDispatchDetailsToJson(SingleDispatchDetails data) =>
    json.encode(data.toJson());

class SingleDispatchDetails {
  List<DispatchDetails> dispatchDetails;

  SingleDispatchDetails({
    required this.dispatchDetails,
  });

  factory SingleDispatchDetails.fromJson(Map<String, dynamic> json) =>
      SingleDispatchDetails(
        dispatchDetails: List<DispatchDetails>.from(
            json["dispatchDetails"].map((x) => DispatchDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dispatchDetails":
            List<dynamic>.from(dispatchDetails.map((x) => x.toJson())),
      };
}

class DispatchDetails {
  String id;
  String customerName;
  String destination;
  String inventoryNumber;
  String inventoryDate;
  String poNumber;
  String soNumber;
  String soDate;
  String coreInnerDiameter;
  String rollOuterDiameter;
  String width;
  String dispatchQuantityInKg;
  String vehicleNumber;
  String firstTransporter;
  String mobileNumber;
  String consignee;
  String dispatchQuantityInSqm;
  String filmtype;

  DispatchDetails(
      {required this.id,
      required this.customerName,
      required this.destination,
      required this.inventoryNumber,
      required this.inventoryDate,
      required this.poNumber,
      required this.soNumber,
      required this.soDate,
      required this.coreInnerDiameter,
      required this.rollOuterDiameter,
      required this.width,
      required this.dispatchQuantityInKg,
      required this.vehicleNumber,
      required this.firstTransporter,
      required this.mobileNumber,
      required this.consignee,
        required this.filmtype,
      required this.dispatchQuantityInSqm});

  factory DispatchDetails.fromJson(Map<String, dynamic> json) =>
      DispatchDetails(
          id: json["_id"],
          customerName: json["customerName"],
          destination: json["destination"],
          inventoryNumber: json["inventoryNumber"],
          inventoryDate: json["inventoryDate"],
          filmtype:json["filmtype"],
          poNumber: json["poNumber"],
          soNumber: json["soNumber"],
          soDate: json["soDate"],
          coreInnerDiameter: json["coreInnerDiameter"],
          rollOuterDiameter: json["rollOuterDiameter"],
          width: json["width"],
          dispatchQuantityInKg: json["dispatchQuantityInKg"],
          vehicleNumber: json["vehicleNumber"],
          firstTransporter: json["firstTransporter"],
          mobileNumber: json["mobileNumber"],
          consignee: json["consignee"],
          dispatchQuantityInSqm: json["dispatchQuantityInSqm"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
        "destination": destination,
        "inventoryNumber": inventoryNumber,
        "inventoryDate": inventoryDate,
        "poNumber": poNumber,
        "soNumber": soNumber,
        "soDate": soDate,
        "coreInnerDiameter": coreInnerDiameter,
        "rollOuterDiameter": rollOuterDiameter,
        "width": width,
        "dispatchQuantityInKg": dispatchQuantityInKg,
        "vehicleNumber": vehicleNumber,
        "firstTransporter": firstTransporter,
        "mobileNumber": mobileNumber,
        "consignee": consignee,
    "filmtype":filmtype,
        "dispatchQuantityInSqm": dispatchQuantityInSqm
      };
}
