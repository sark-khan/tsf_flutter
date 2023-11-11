import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:tsf/components/Buttons.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/SingleOrderDetailsResponse.dart';

class OrderDetails extends StatefulWidget {
  String? orderId;
  OrderDetails({this.orderId, super.key});

  @override
  State createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String selectedItem = "High";
  final List orderDetails = [
    [
      'Customer Name',
      'customerName',
    ],
    [
      'Destination',
      'destination',
    ],
    [
      'Customer PO No',
      'customerPoNo',
    ],
    [
      'So Number',
      'soNumber',
    ],
    [
      'So Date',
      'soDate',
    ],
    [
      'Film Type',
      'filmType',
    ],
    [
      'core Id Mm',
      'coreIdMm',
    ],
    [
      'Roll outer Dia (mm)',
      'length',
    ],
    [
      'Width (MM)',
      'widthMm',
    ],
    [
      'Order Quantity (kg)',
      'soQuantity',
    ],
    [
      'Dispatched Quantity (Kg)',
      'despQty',
    ],
    [
      'Total Ready Stock/Finished Goods Quantity (kg)',
      'pendToDespatchQty',
    ],
    [
      'Pending for Production (kg)',
      'toProduceSoQty',
    ],
    [
      'Request Date',
      'requestDate',
    ],
    [
      'Promise Date',
      'promiseDate',
    ],
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
          title: Text(TextConstants().ORDER_DETAILS),
          backgroundColor: Colors.blue,
          elevation: 4.0,
          toolbarHeight: 70.0,
          actions: <Widget>[
            Buttons().addCommentsButton("Add Comments", context),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            // TopLayer().topLayerWidget("Home", context, visiblity: true),
            FutureBuilder(
              future: CommonFunctions().getOrderDetails("1232323"),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  ReturnObj ret =
                      snapshot.data!;
                  if(!ret!.status){
                    return Center(
                      child: Text(ret.message),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: orderDetails.length,
                        itemBuilder: (context, index) {

                          List _orderUIKeys = orderDetails[index];

                          Map jsonVal =
                              json.decode(json.encode(ret.data));

                          dynamic value = jsonVal[_orderUIKeys[1]];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '${_orderUIKeys[0]}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '$value',
                                    style:
                                        TextStyle(overflow: TextOverflow.clip),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
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
