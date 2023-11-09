// To parse this JSON data, do
//
//     final singleOrderDetailsResponse = singleOrderDetailsResponseFromJson(jsonString);

import 'dart:convert';

SingleOrderDetailsResponse singleOrderDetailsResponseFromJson(String str) =>
    SingleOrderDetailsResponse.fromJson(json.decode(str));

String singleOrderDetailsResponseToJson(SingleOrderDetailsResponse data) =>
    json.encode(data.toJson());

class SingleOrderDetailsResponse {
  SingleOrderDetails singleOrderDetails;

  SingleOrderDetailsResponse({
    required this.singleOrderDetails,
  });

  factory SingleOrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      SingleOrderDetailsResponse(
        singleOrderDetails:
            SingleOrderDetails.fromJson(json["singleOrderDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "singleOrderDetails": singleOrderDetails.toJson(),
      };
}

class SingleOrderDetails {
  String id;
  String orderId;
  String region;
  String customerName;
  String organizationName;
  String userAccountNumber;
  String filmType;
  String soNumber;
  String orderSource;
  String soQuantity;
  String grade;
  String noOfRolls;
  String widthMm;
  String salesOrderLineNumber;
  String unitPrice;
  String coreIdMm;
  String length;
  String singleRollWt;
  String preFg;
  String totalAvailableStockFgPack;
  String despQty;
  String pendToDespatchQty;
  String toProduceSoQty;
  String cancelledQty;
  DateTime requestDate;
  DateTime soDate;
  DateTime promiseDate;
  String customerPoNo;
  String collectorName;
  String destination;
  String consigneeDetails;
  String remarks;
  String currency;
  String cashDiscType;
  String cashDiscValue;
  String splDiscType;
  String splDiscValue;
  String orderStatus;
  String paymentTerms;
  String approvalStatus;
  String taxCategory;
  String saleCategory;
  String packingType;
  String palletType;
  String palletTier;
  String planningStatus;
  int v;

  SingleOrderDetails({
    required this.id,
    required this.orderId,
    required this.region,
    required this.customerName,
    required this.organizationName,
    required this.userAccountNumber,
    required this.filmType,
    required this.soNumber,
    required this.orderSource,
    required this.soQuantity,
    required this.grade,
    required this.noOfRolls,
    required this.widthMm,
    required this.salesOrderLineNumber,
    required this.unitPrice,
    required this.coreIdMm,
    required this.length,
    required this.singleRollWt,
    required this.preFg,
    required this.totalAvailableStockFgPack,
    required this.despQty,
    required this.pendToDespatchQty,
    required this.toProduceSoQty,
    required this.cancelledQty,
    required this.requestDate,
    required this.soDate,
    required this.promiseDate,
    required this.customerPoNo,
    required this.collectorName,
    required this.destination,
    required this.consigneeDetails,
    required this.remarks,
    required this.currency,
    required this.cashDiscType,
    required this.cashDiscValue,
    required this.splDiscType,
    required this.splDiscValue,
    required this.orderStatus,
    required this.paymentTerms,
    required this.approvalStatus,
    required this.taxCategory,
    required this.saleCategory,
    required this.packingType,
    required this.palletType,
    required this.palletTier,
    required this.planningStatus,
    required this.v,
  });

  factory SingleOrderDetails.fromJson(Map<String, dynamic> json) =>
      SingleOrderDetails(
        id: json["_id"],
        orderId: json["orderId"],
        region: json["region"],
        customerName: json["customerName"],
        organizationName: json["organizationName"],
        userAccountNumber: json["userAccountNumber"],
        filmType: json["filmType"],
        soNumber: json["soNumber"],
        orderSource: json["orderSource"],
        soQuantity: json["soQuantity"],
        grade: json["grade"],
        noOfRolls: json["noOfRolls"],
        widthMm: json["widthMm"],
        salesOrderLineNumber: json["salesOrderLineNumber"],
        unitPrice: json["unitPrice"],
        coreIdMm: json["coreIdMm"],
        length: json["length"],
        singleRollWt: json["singleRollWt"],
        preFg: json["preFg"],
        totalAvailableStockFgPack: json["totalAvailableStockFgPack"],
        despQty: json["despQty"],
        pendToDespatchQty: json["pendToDespatchQty"],
        toProduceSoQty: json["toProduceSoQty"],
        cancelledQty: json["cancelledQty"],
        requestDate: DateTime.parse(json["requestDate"]),
        soDate: DateTime.parse(json["soDate"]),
        promiseDate: DateTime.parse(json["promiseDate"]),
        customerPoNo: json["customerPoNo"],
        collectorName: json["collectorName"],
        destination: json["destination"],
        consigneeDetails: json["consigneeDetails"],
        remarks: json["remarks"],
        currency: json["currency"],
        cashDiscType: json["cashDiscType"],
        cashDiscValue: json["cashDiscValue"],
        splDiscType: json["splDiscType"],
        splDiscValue: json["splDiscValue"],
        orderStatus: json["orderStatus"],
        paymentTerms: json["paymentTerms"],
        approvalStatus: json["approvalStatus"],
        taxCategory: json["taxCategory"],
        saleCategory: json["saleCategory"],
        packingType: json["packingType"],
        palletType: json["palletType"],
        palletTier: json["palletTier"],
        planningStatus: json["planningStatus"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "orderId": orderId,
        "region": region,
        "customerName": customerName,
        "organizationName": organizationName,
        "userAccountNumber": userAccountNumber,
        "filmType": filmType,
        "soNumber": soNumber,
        "orderSource": orderSource,
        "soQuantity": soQuantity,
        "grade": grade,
        "noOfRolls": noOfRolls,
        "widthMm": widthMm,
        "salesOrderLineNumber": salesOrderLineNumber,
        "unitPrice": unitPrice,
        "coreIdMm": coreIdMm,
        "length": length,
        "singleRollWt": singleRollWt,
        "preFg": preFg,
        "totalAvailableStockFgPack": totalAvailableStockFgPack,
        "despQty": despQty,
        "pendToDespatchQty": pendToDespatchQty,
        "toProduceSoQty": toProduceSoQty,
        "cancelledQty": cancelledQty,
        "requestDate":
            "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
        "soDate":
            "${soDate.year.toString().padLeft(4, '0')}-${soDate.month.toString().padLeft(2, '0')}-${soDate.day.toString().padLeft(2, '0')}",
        "promiseDate":
            "${promiseDate.year.toString().padLeft(4, '0')}-${promiseDate.month.toString().padLeft(2, '0')}-${promiseDate.day.toString().padLeft(2, '0')}",
        "customerPoNo": customerPoNo,
        "collectorName": collectorName,
        "destination": destination,
        "consigneeDetails": consigneeDetails,
        "remarks": remarks,
        "currency": currency,
        "cashDiscType": cashDiscType,
        "cashDiscValue": cashDiscValue,
        "splDiscType": splDiscType,
        "splDiscValue": splDiscValue,
        "orderStatus": orderStatus,
        "paymentTerms": paymentTerms,
        "approvalStatus": approvalStatus,
        "taxCategory": taxCategory,
        "saleCategory": saleCategory,
        "packingType": packingType,
        "palletType": palletType,
        "palletTier": palletTier,
        "planningStatus": planningStatus,
        "__v": v,
      };
}
