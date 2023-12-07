import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
// import 'package:horizontal_data_table/scroll/linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tsf/utils/commonFunctions.dart';


final List orderDetails = [
  [
    'Customer Name-',
    'customerName',
  ],
  [
    'Destination-',
    'destination',
  ],
  [
    'Customer PO No-',
    'customerPoNo',
  ],
  [
    'So Number-',
    'soNumber',
  ],
  [
    'So Date-',
    'soDate',
  ],
  [
    'Film Type-',
    'filmType',
  ],
  [
    'Core inner diameter Mm-',
    'coreIdMm',
  ],
  [
    'Roll outer diameter (mm)-',
    'length',
  ],
  [
    'Width (MM)-',
    'widthMm',
  ],
  [
    'Order Quantity (kg)-',
    'soQuantity',
  ],
  [
    'Dispatched Quantity (Kg)-',
    'despQty',
  ],
  [
    'Total Ready Stock/Finished Goods Quantity (kg)-',
    'pendToDespatchQty',
  ],
  [
    'Pending for Production (kg)-',
    'toProduceSoQty',
  ],
  [
    'Request Date-',
    'requestDate',
  ],
  [
    'Promise Date-',
    'promiseDate',
  ],
  ['Remark-', 'remark'],
  ['Consignee', 'consignee']
];

final dispatchDetailsOrder = [
  ["Customer Name -", "customerName"],
  // ["Region -", "region"],
  ["Destination -", "destination"],
  ["Invoice Number -", "inventoryNumber"],
  ["Invoice Date -", "inventoryDate"],
  ["Customer PO Number -", "poNumber"],
  ["SO Number -", "soNumber"],
  ["SO Date -", "soDate"],
  ["Film Type -", "filmtype"],
  ["Core Inner Diameter -", "coreInnerDiameter"],
  ["Roll Outer Diameter -", "rollOuterDiameter"],
  ["Width (mm)-", "width"],
  ["Dispatch Quantity In Kg -", "dispatchQuantityInKg"],
  ["Vehicle Number -", "vehicleNumber"],
  // ["Customer Account Code -", "customerAccountCode"],
  // ["MKT SO Number -", "mktSoNumber"],
  // ["Dispatch Quantity In Sqm -", "dispatchQuantityInSqm"],
  ["First Transporter -", "firstTransporter"],
  // ["Trip Number -", "tripNumber"],
  // ["LR Number -", "lrNumber"],
  // ["Second Transporter -", "secondTransporter"],
  ["Mobile Number -", "mobileNumber"],
  // ["Sale Category -", "saleCategory"],
  ["Collector Name -", "collectorName"],
  // ["Grade -", "grade"],
  // ["Value -", "value"],
  // ["Packing Type -", "packingType"],
  ["Consignee -", "consignee"],
];

// ... Your orderDetails and dispatchDetailsOrder lists ...

// and dispatchDetailsOrder lists ...
// ... Your orderDetails and dispatchDetailsOrder lists ...

// Your orderDetails and dispatchDetailsOrder lists ..
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

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headerScrollController = _controllers!.addAndGet();
    _bodyScrollController = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _headerScrollController!.dispose();
    _bodyScrollController!.dispose();
    super.dispose();
  }

  Widget _buildHeader(List<String> headers) {
    List<String> headerTitles = orderDetails.map((detail) => detail[0].toString()).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _headerScrollController,
      child: Row(
        children: headers.map((header) {
          return Container(
            width: 200, // Adjust width as needed
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(header, style: TextStyle(fontWeight: FontWeight.bold)),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRow(Map<String, dynamic> item, List<String> headers) {
    return Row(
      children: headers.map((header) {
        return Container(
          width: 200, // Set a fixed width for each cell
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(item[header]?.toString() ?? 'N/A'),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isOrderPage!
            ? Text('ORDER DETAILS', style: TextStyle(fontSize: 19))
            : Text("Dispatch Details", style: TextStyle(fontSize: 19)),
        backgroundColor: Colors.blue,
        elevation: 4.0,
        toolbarHeight: 70.0,
      ),
      body: FutureBuilder(
        future: widget.isOrderPage!
            ? CommonFunctions().getOrderDetails(widget.orderId!)
            : CommonFunctions().getDispatchDetails(widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              ReturnObj response = snapshot.data!;
              var data = json.decode(json.encode(response.data)); // Assuming 'data' is a JSON array

              List<String> headers = data.isNotEmpty ? data.first.keys.cast<String>().toList() : [];

              return Column(
                children: [
                  _buildHeader(headers),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _bodyScrollController,
                        child: Column(
                          children: data.map<Widget>((item) => _buildRow(item, headers)).toList(),
                        ),
                      ),
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

void main() => runApp(MaterialApp(home: OrderDetails(isOrderPage: true, orderId: '123')));
