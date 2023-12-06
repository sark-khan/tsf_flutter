// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/GetComments.dart';

// ignore: must_be_immutable
class PriorityRequests extends StatefulWidget {
  BuildContext? context;
  PriorityRequests({this.context, super.key});

  @override
  State<PriorityRequests> createState() => _PriorityRequestsState();
}

class _PriorityRequestsState extends State<PriorityRequests> {
  List<GetOrderCommentsDetail> commentsList = [];
  bool _isScreenLoading = true;
  bool? getterStatus;
  @override
  void initState() {
    super.initState();
    getUserComments();
  }

  getUserComments() async {
    try {
      print("reached here");
      ReturnObj returnObj = await CommonFunctions().getComments();
      commentsList = returnObj.data;
      print("heelo ${commentsList}");
      _isScreenLoading = false;
      getterStatus = returnObj.status;
      setState(() {});
    } catch (_) {
      _isScreenLoading = getterStatus = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseUI(
            headline: "USER COMMENTS",
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  child: _isScreenLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.blueGrey,
                        ))
                      : SingleChildScrollView(
                          child: Table(
                              columnWidths: {
                                0: FlexColumnWidth(10),
                                1: FlexColumnWidth(10),
                                2: FlexColumnWidth(10),
                                3: FlexColumnWidth(10),
                                4: FlexColumnWidth(20),
                                5: FlexColumnWidth(5)
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.bottom,
                              border: TableBorder.all(),
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Order ID',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Order Line Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Customer Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Customer Code',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'User Comments',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'CommentedAt',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )
                                ]),
                                ...List.generate(
                                  commentsList.length,
                                  (index) => _tableRow(index),
                                )
                              ]),
                        ),
                ),
              ],
            )));
  }

  TableRow _tableRow(int index) {
    GetOrderCommentsDetail commentsDetail = commentsList[index];
    DateTime timestamp = DateTime.parse(commentsDetail.updatedAt.toString());
    String formattedTimestamp = DateFormat.yMd().add_Hms().format(timestamp);

    return TableRow(
        decoration: !(index % 2 == 0)
            ? BoxDecoration(color: Colors.blueGrey[50])
            : const BoxDecoration(color: Colors.white),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(commentsDetail.order.soNumber),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(commentsDetail.order.salesOrderLineNumber),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(commentsDetail.sender.partyName ??
                commentsDetail.order.customerName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(commentsDetail.sender.accountNumber),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(children: [Text(commentsDetail.text)]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(children: [
              Text(
                formattedTimestamp,
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ]);
  }
}
