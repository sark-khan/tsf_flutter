import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tsf/components/Buttons.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';

final List orderDetails = [
  // [
  //   'Customer Name',
  //   'customerName',
  // ],

  // [
  //   'Destination',
  //   'destination',
  // ],
  [
    'Customer PO No',
    'customerPoNo',
  ],

  [
    'Film Type',
    'filmType',
  ],
  [
    'Width',
    'widthMm',
  ],
  // ["Length", "length"],
  [
    'Core ID',
    'coreIdMm',
  ],
  [
    'Roll OD',
    'odMm',
  ],
  [
    'Order Quantity',
    'soQuantity',
  ],
  [
    'Dispatched Quantity',
    'despQty',
  ],
  [
    'Total Ready Stock',
    'totalAvailableStockFgPack',
  ],

  [
    'Pending for Production',
    'toProduceSoQty',
  ],
  ['Unit', 'uom'],
  ["Grade", 'grade'],

  // [
  //   'Request Date',
  //   'requestDate',
  // ],
  [
    'Promise Date',
    'promiseDate',
  ],
  [
    'Destination',
    'destination',
  ],
  [
    'So Number',
    'soNumber',
  ],
  [
    'So Date',
    'soDate',
  ],
  // ['Remark', 'remarks'],
  ['Consignee', 'consigneeDetails']
];

final dispatchDetailsOrder = [
  // ["Customer Name -", "customerName"],
  // // ["Region -", "region"],
  // ["Destination -", "destination"],
  ["PO Number", "poNumber"],
  ["Invoice Number", "inventoryNumber"],
  ["Invoice Date", "inventoryDate"],

  ["Film Code", "filmtype"],
  ["Width (mm)", "width"],
  ["Core ID", "coreInnerDiameter"],
  ["Roll OD", "rollOuterDiameter"],

  ["Dispatch Quantity (kg)", "dispatchQuantityInKg"],
  ["Dispatch Quantity (Sqm) -", "dispatchQuantityInSqm"],
  ["Vehicle Number", "vehicleNumber"],
  // ["Customer Account Code -", "customerAccountCode"],
  // ["MKT SO Number -", "mktSoNumber"],
  // ["First Transporter", "firstTransporter"],
  // ["Trip Number -", "tripNumber"],
  // ["LR Number -", "lrNumber"],
  // ["Second Transporter -", "secondTransporter"],
  ["Mobile Number", "mobileNumber"],
  ["Destination", "destination"],
  ["SO Number", "soNumber"],
  ["SO Date", "soDate"],
  // ["Sale Category -", "saleCategory"],
  // ["Collector Name", "collectorName"],
  // ["Grade -", "grade"],
  // ["Value -", "value"],
  // ["Packing Type -", "packingType"],
  ["Consignee", "consignee"],
];

Map<String, double> columnWidths = {
  'soNumber': 100.0,
  'soDate': 100.0,
  'filmType': 120.0,
  'filmtype': 120.0,
  'widthMm': 50.0,
  'coreIdMm': 50.0,
  'length': 60.0,
  'soQuantity': 100.0,
  'despQty': 100.0,
  'pendToDespatchQty': 100.0,
  'toProduceSoQty': 100.0,
  'requestDate': 100.0,
  'promiseDate': 100.0,
  'remarks': 100.0,
  'consigneeDetails': 150.0,
  'poNumber': 140.0,
  "customerPoNo": 200.0,
  "width": 50.0,
  "coreInnerDiameter": 50.0,
  "rollOuterDiameter": 50.0,
  "dispatchQuantityInKg": 100.0,
  "vehicleNumber": 100.0,
  "firstTransporter": 150.0,
  "mobileNumber": 150.0,
  "collectorName": 100.0,
  "uom": 50.0,
  'grade': 50.0,
  'odMm': 50.0,
  'dispatchQuantityInSqm': 100.0
};

class OrderDetails extends StatefulWidget {
  final String? orderId;
  final bool? isOrderPage;
  OrderDetails({this.orderId, this.isOrderPage, Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _headerScrollController;
  ScrollController? _bodyScrollController;
  String poNumber = "";
  String destination = "";
  String invoiceNumber = "";
  String invoiceDate = "";
  String grade = "";
  String remark = "";

  bool dataProcessed = false;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headerScrollController = _controllers!.addAndGet();
    _bodyScrollController = _controllers!.addAndGet();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _headerScrollController!.dispose();
    _bodyScrollController!.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Map<String, String> createHeaderMap() {
    Map<String, String> headerMap = {};
    if (widget.isOrderPage!) {
      for (var detail in orderDetails) {
        if (widget.orderId != "-1" &&
            (detail[1] == "customerPoNo" ||
                detail[1] == "destination" ||
                detail[1] == "grade")) {
          continue;
        }
        headerMap[detail[1]] = detail[0];
      }
      return headerMap;
    } else {
      for (var detail in dispatchDetailsOrder) {
        if (widget.orderId != "-1" &&
            (detail[1] == "inventoryNumber" ||
                detail[1] == "destination" ||
                detail[1] == "inventoryDate")) {
          continue;
        }
        headerMap[detail[1]] = detail[0];
      }
      return headerMap;
    }
  }

  Widget _buildHeader() {
    Map<String, String> headerMap = createHeaderMap();

    return Container(
      color: Colors.grey[350],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _headerScrollController,
        child: Row(
          children: headerMap.entries.map((entry) {
            double columnWidth = columnWidths[entry.key] ??
                100.0; // Default width if not specified
            return Container(
              width: columnWidth,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Text(entry.value,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRow(Map<String, dynamic> item, int index) {
    Map<String, String> headerMap = createHeaderMap();

    // Alternating row color
    Color rowColor = index % 2 == 0 ? Colors.grey[200]! : Colors.white;

    return Container(
      color: rowColor,
      child: Row(
        children: headerMap.keys.map((apiHeader) {
          var value = item[apiHeader];
          if (value == null || value.toString().isEmpty) {
            if (apiHeader == "remark" ||
                apiHeader == "consignee" ||
                apiHeader == "collectorName" ||
                apiHeader == "promiseDate" ||
                apiHeader == "requestDate" ||
                apiHeader == "soDate") {
              value = 'N/A';
            } else {
              value = 0;
            }
          }
          if (apiHeader == "promiseDate" ||
              apiHeader == "requestDate" ||
              apiHeader == "soDate") {
            value = value.toString();
            if (value.contains("T")) {
              value = value.split("T")[0];
            }
          }
          double columnWidth = columnWidths[apiHeader] ??
              100.0; // Default width if not specified
          return Container(
            width: columnWidth,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isOrderPage!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextConstants().ORDER_DETAILS,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 25),
                  widget.orderId != "-1"
                      ? Row(
                          children: [
                            Column(
                              children: [
                                Text("Po Number :",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  poNumber,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Text("Destination :",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  destination,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Text("Grade :", style: TextStyle(fontSize: 12)),
                                Text(
                                  grade,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextConstants().DISPATCH_DETAILS,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 25),
                  widget.orderId != "-1"
                      ? Row(
                          children: [
                            Column(
                              children: [
                                const Text("INV. #:",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  invoiceNumber,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                const Text("Inv. Date",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  invoiceDate,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                const Text("Destination :",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  destination,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
        backgroundColor: Colors.blue,
        elevation: 4.0,
        toolbarHeight: 70.0,
        actions: widget.isOrderPage! && widget.orderId != "-1"
            ? [
                Buttons()
                    .addCommentsButton("Add Comments", context, widget.orderId!)
              ]
            : null,
      ),
      body: FutureBuilder(
        future: widget.isOrderPage!
            ? CommonFunctions().getOrderDetails(widget.orderId!)
            : CommonFunctions().getDispatchDetails(widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              ReturnObj response = snapshot.data!;

              var data = json.decode(json.encode(response.data));
              // print(
              //     "data >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${data.length}");
              // if (data.length == 0) {
              //   return SizedBox();
              // }
              // // print('heeeeeee${data[0]}'); // Assuming 'data' is a JSON array
              if (data.length != 0) {
                if (widget.isOrderPage!) {
                  var tempPoNumber = data?[0]["customerPoNo"];
                  var tempDestination = data?[0]["destination"];
                  var tempGrade = data?[0]["grade"];
                  var remark = data?[0]["remarks"];
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!dataProcessed) {
                      setState(() {
                        if (remark != "" || remark != null) {
                          columnWidths["remarks"] = 200.0;
                        }
                        poNumber = tempPoNumber;
                        destination = tempDestination;
                        grade = tempGrade;
                      });
                      dataProcessed = true;
                    }
                  });
                } else {
                  var tempInvoiceNumber = data[0]["inventoryNumber"];
                  var tempinvoiceDate = data[0]["inventoryDate"];
                  var tempDestination = data[0]["destination"];
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!dataProcessed) {
                      setState(() {
                        invoiceNumber = tempInvoiceNumber;
                        invoiceDate = tempinvoiceDate;
                        destination = tempDestination;
                      });
                      dataProcessed = true;
                    }
                  });
                }
              }
              List<String> headers = data.isNotEmpty
                  ? data.first.keys.cast<String>().toList()
                  : [];

              return Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _bodyScrollController,
                          child: Column(
                            children:
                                data?.asMap().entries.map<Widget>((entry) {
                              int index = entry.key;
                              Map<String, dynamic> item = entry.value;
                              return _buildRow(item, index);
                            }).toList(),
                          )),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

void main() =>
    runApp(MaterialApp(home: OrderDetails(isOrderPage: true, orderId: '123')));
