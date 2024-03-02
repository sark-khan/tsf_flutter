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
      ReturnObj returnObj = await CommonFunctions().getComments();
      commentsList = returnObj.data;
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
                Expanded(
                  // height: 600,
                  // width: double.infinity,
                  child: _isScreenLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.blueGrey,
                        ))
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Table(
                                columnWidths: {
                                  0: FixedColumnWidth(160),
                                  1: FixedColumnWidth(160),
                                  2: FixedColumnWidth(160),
                                  3: FixedColumnWidth(160),
                                  4: FixedColumnWidth(260),
                                  5: FixedColumnWidth(160)
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.bottom,
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'So Number',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Customer Po Number',
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
                ),
              ],
            )));
  }

  TableRow _tableRow(int index) {
    GetOrderCommentsDetail commentsDetail = commentsList[index];
    // DateTime timestamp = DateTime.parse(commentsDetail.updatedAt.toString());
    String formattedTimestamp = commentsDetail.updatedAt;

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
            child: Text(commentsDetail.order.customerPoNo),
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
