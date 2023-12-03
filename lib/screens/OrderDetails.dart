import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:tsf/components/Buttons.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';

class OrderDetails extends StatefulWidget {
  String? orderId;
  bool? isOrderPage;
  OrderDetails({this.orderId, super.key, this.isOrderPage});

  @override
  State createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String selectedItem = "High";
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
      'core Id Mm-',
      'coreIdMm',
    ],
    [
      'Roll outer Dia (mm)-',
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
  ];

  final dispatchDetailsOrder = [
    ["Customer Name -", "customerName"],
    ["Region -", "region"],
    ["Destination -", "destination"],
    ["Inventory Number -", "inventoryNumber"],
    ["Inventory Date -", "inventoryDate"],
    ["PO Number -", "poNumber"],
    ["SO Number -", "soNumber"],
    ["SO Date -", "soDate"],
    ["Film Type -", "filmtype"],
    ["Core Inner Diameter -", "coreInnerDiameter"],
    ["Roll Outer Diameter -", "rollOuterDiameter"],
    ["Width -", "width"],
    ["Dispatch Quantity In Kg -", "dispatchQuantityInKg"],
    ["Vehicle Number -", "vehicleNumber"],
    ["Customer Account Code -", "customerAccountCode"],
    ["MKT SO Number -", "mktSoNumber"],
    ["Dispatch Quantity In Sqm -", "dispatchQuantityInSqm"],
    ["First Transporter -", "firstTransporter"],
    ["Trip Number -", "tripNumber"],
    ["LR Number -", "lrNumber"],
    ["Second Transporter -", "secondTransporter"],
    ["Mobile Number -", "mobileNumber"],
    ["Sale Category -", "saleCategory"],
    ["Collector Name -", "collectorName"],
    ["Grade -", "grade"],
    ["Value -", "value"],
    ["Packing Type -", "packingType"],
    ["Consignee -", "consignee"],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // getOrderDetails() async {
  //   // _orderDetails = await CommonFunctions().getOrderDetails(widget.orderId);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: widget.isOrderPage!
              ? Text(
                  TextConstants().ORDER_DETAILS,
                  style: TextStyle(fontSize: 19),
                )
              : Text("Dispatch Details", style: TextStyle(fontSize: 19)),
          backgroundColor: Colors.blue,
          elevation: 4.0,
          toolbarHeight: 70.0,
          actions: widget.isOrderPage!
              ? [
                  Buttons().addCommentsButton(
                      "Add Comments", context, widget.orderId!)
                ]
              : null,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            // TopLayer().topLayerWidget("Home", context, visiblity: true),
            FutureBuilder(
              future: widget.isOrderPage!
                  ? CommonFunctions().getOrderDetails(widget.orderId!)
                  : CommonFunctions().getDispatchDetails(widget.orderId),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  ReturnObj ret = snapshot.data!;
                  if (!ret!.status) {
                    return Center(
                      child: Text(ret.message),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: widget.isOrderPage!
                            ? orderDetails.length
                            : dispatchDetailsOrder.length,
                        itemBuilder: (context, index) {
                          List _orderUIKeys = widget.isOrderPage!
                              ? orderDetails[index]
                              : dispatchDetailsOrder[index];

                          Map jsonVal = json.decode(json.encode(ret.data));

                          dynamic value = jsonVal[_orderUIKeys[1]];
                          if (value == null || value == "") {
                            return SizedBox.shrink();
                          }
                          return Container(
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 15.0, vertical: 10.0),
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.lightBlue[99]
                                  : Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, bottom: 10),
                                      child: Text(
                                        '${_orderUIKeys[0]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          right: 0,
                                          left: 10,
                                          top: 10,
                                          bottom: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${value ?? ''}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.clip),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(TextConstants().SERVER_BUSY),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                }
              },
            )
          ],
        ));
  }
}
