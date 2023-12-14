import 'dart:convert';

SingleOrderDetailsResponse singleOrderDetailsResponseFromJson(String str) =>
    SingleOrderDetailsResponse.fromJson(json.decode(str));

String singleOrderDetailsResponseToJson(SingleOrderDetailsResponse data) =>
    json.encode(data.toJson());

class SingleOrderDetailsResponse {
  List<SingleOrderDetail> singleOrderDetails;

  SingleOrderDetailsResponse({
    required this.singleOrderDetails,
  });

  factory SingleOrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      SingleOrderDetailsResponse(
        singleOrderDetails: List<SingleOrderDetail>.from(
            json["singleOrderDetails"]
                .map((x) => SingleOrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "singleOrderDetails":
            List<dynamic>.from(singleOrderDetails.map((x) => x.toJson())),
      };
}

class SingleOrderDetail {
  String id;
  String customerName;
  String filmType;
  String soNumber;
  String soQuantity;
  String widthMm;
  String salesOrderLineNumber;
  String coreIdMm;
  String odMm;
  String totalAvailableStockFgPack;
  String despQty;
  String toProduceSoQty;
  String requestDate;
  String soDate;
  String promiseDate;
  String customerPoNo;
  String destination;
  String consigneeDetails;
  String remarks;
  String uom;

  SingleOrderDetail({
    required this.id,
    required this.customerName,
    required this.filmType,
    required this.soNumber,
    required this.soQuantity,
    required this.widthMm,
    required this.salesOrderLineNumber,
    required this.coreIdMm,
    required this.odMm,
    required this.totalAvailableStockFgPack,
    required this.despQty,
    required this.toProduceSoQty,
    required this.requestDate,
    required this.soDate,
    required this.promiseDate,
    required this.customerPoNo,
    required this.destination,
    required this.consigneeDetails,
    required this.remarks,
    required this.uom,
  });

  factory SingleOrderDetail.fromJson(Map<String, dynamic> json) =>
      SingleOrderDetail(
        id: json["_id"],
        customerName: json["customerName"],
        filmType: json["filmType"],
        soNumber: json["soNumber"],
        soQuantity: json["soQuantity"],
        widthMm: json["widthMm"],
        salesOrderLineNumber: json["salesOrderLineNumber"],
        coreIdMm: json["coreIdMm"],
        odMm: json["odMm"],
        totalAvailableStockFgPack: json["totalAvailableStockFgPack"],
        despQty: json["despQty"],
        toProduceSoQty: json["toProduceSoQty"],
        requestDate: json["requestDate"],
        soDate: json["soDate"],
        promiseDate: json["promiseDate"],
        customerPoNo: json["customerPoNo"],
        destination: json["destination"],
        consigneeDetails: json["consigneeDetails"],
        remarks: json["remarks"],
        uom: json["uom"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
        "filmType": filmType,
        "soNumber": soNumber,
        "soQuantity": soQuantity,
        "widthMm": widthMm,
        "salesOrderLineNumber": salesOrderLineNumber,
        "coreIdMm": coreIdMm,
        "odMm": odMm,
        "totalAvailableStockFgPack": totalAvailableStockFgPack,
        "despQty": despQty,
        "toProduceSoQty": toProduceSoQty,
        "requestDate": requestDate,
        "soDate": soDate,
        "promiseDate": promiseDate,
        "customerPoNo": customerPoNo,
        "destination": destination,
        "consigneeDetails": consigneeDetails,
        "remarks": remarks,
        "uom": uom,
      };
}
