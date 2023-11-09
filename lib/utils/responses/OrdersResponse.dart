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
  String? id;
  String? region;
  String? customerName;
  String? organizationName;
  String? customerCode;
  String? filmType;
  String? soNumber;
  String? orderSource;
  String? soQuantity;
  String? grade;
  String? noOfRolls;
  String? widthMm;
  String? salesOrderLineNumber;
  String? unitPrice;
  String? coreIdMm;
  String? length;
  String? singleRollWt;
  String? fgStock;
  String? preFg;
  String? totalAvailableStockFgPack;
  String? despQty;
  String? pendToDespatchQty;
  String? toProduceSoQty;
  String? cancelledQty;
  String? requestDate;
  String? soDate;
  String? promiseDate;
  String? customerPoNo;
  String? collectorName;
  String? destination;
  String? consigneeDetails;
  String? remarks;
  String? currency;
  String? cashDiscType;
  String? cashDiscValue;
  String? splDiscType;
  String? splDiscValue;
  String? orderStatus;
  String? paymentTerms;
  String? approvalStatus;
  String? taxCategory;
  String? saleCategory;
  String? packingType;
  String? palletType;
  String? palletTier;
  String? planningStatus;

  Order({
    this.id,
    this.region,
    this.customerName,
    this.organizationName,
    this.customerCode,
    this.filmType,
    this.soNumber,
    this.orderSource,
    this.soQuantity,
    this.grade,
    this.noOfRolls,
    this.widthMm,
    this.salesOrderLineNumber,
    this.unitPrice,
    this.coreIdMm,
    this.length,
    required this.singleRollWt,
    this.fgStock,
    this.preFg,
    this.totalAvailableStockFgPack,
    this.despQty,
    this.pendToDespatchQty,
    this.toProduceSoQty,
    this.cancelledQty,
    this.requestDate,
    this.soDate,
    this.promiseDate,
    this.customerPoNo,
    this.collectorName,
    this.destination,
    this.consigneeDetails,
    this.remarks,
    this.currency,
    this.cashDiscType,
    this.cashDiscValue,
    this.splDiscType,
    this.splDiscValue,
    this.orderStatus,
    this.paymentTerms,
    this.approvalStatus,
    this.taxCategory,
    this.saleCategory,
    this.packingType,
    this.palletType,
    this.palletTier,
    this.planningStatus,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        region: json["region"],
        customerName: json["customerName"],
        organizationName: json["organizationName"],
        customerCode: json["customerCode"],
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
        fgStock: json["fgStock"],
        preFg: json["preFg"],
        totalAvailableStockFgPack: json["totalAvailableStockFgPack"],
        despQty: json["despQty"],
        pendToDespatchQty: json["pendToDespatchQty"],
        toProduceSoQty: json["toProduceSoQty"],
        cancelledQty: json["cancelledQty"],
        requestDate: json["requestDate"],
        soDate: json["soDate"],
        promiseDate: json["promiseDate"],
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
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "region": region,
        "customerName": customerName,
        "organizationName": organizationName,
        "customerCode": customerCode,
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
        "fgStock": fgStock,
        "preFg": preFg,
        "totalAvailableStockFgPack": totalAvailableStockFgPack,
        "despQty": despQty,
        "pendToDespatchQty": pendToDespatchQty,
        "toProduceSoQty": toProduceSoQty,
        "cancelledQty": cancelledQty,
        "requestDate": requestDate,
        "soDate": soDate,
        "promiseDate": promiseDate,
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
      };
}
