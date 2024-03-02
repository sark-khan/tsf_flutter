// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/NotificationResponse.dart';

// ignore: must_be_immutable
class AdminNotifications extends StatefulWidget {
  BuildContext? context;
  AdminNotifications({this.context, super.key});

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  bool _isScreenLoading = true;
  double headerFontDesktop = 18;
  double headerFontMobile = 12;
  double header2Fontdesktop = 15;
  double header2FontMobile = 10;

  bool? getterStatus;
  List<Message> notifications = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotifications();
  }

  getNotifications() async {
    try {
      ReturnObj obj = await CommonFunctions().getNotifications();
      notifications = obj.data;
      _isScreenLoading = false;
      getterStatus = obj.status;
      setState(() {});
    } catch (_) {
      _isScreenLoading = getterStatus = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BaseUI(
            headline: "NOTIFICATIONS",
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _isScreenLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.grey,
                      ))
                    : !getterStatus!
                        ? Center(child: Text("Something Went Wrong! :/"))
                        : Expanded(
                            // height: 600,
                            // width: double.infinity,

                            child: ListView.builder(
                                itemCount: notifications.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Message notif = notifications[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? Colors.blueGrey[100]
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      notif.notificationText,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: screenWidth >
                                                                  500
                                                              ? headerFontDesktop
                                                              : headerFontMobile),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      notif.notificationText
                                                          .split(" has ")[0]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: screenWidth >
                                                                  500
                                                              ? header2Fontdesktop
                                                              : header2FontMobile),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  notif.createdAt,
                                                  style: TextStyle(
                                                    color: Colors.grey[900],
                                                    fontSize: screenWidth > 500
                                                        ? header2Fontdesktop
                                                        : header2FontMobile,
                                                    // overflow: TextOverflow
                                                    //     .ellipsis, // Change this line
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
              ],
            )));
  }

  TableRow _tableRow(int index, String orderId, String SoNo,
      String CustomerCode, String Comments) {
    return TableRow(
        decoration: !(index % 2 == 0)
            ? BoxDecoration(color: Colors.blueGrey[50])
            : const BoxDecoration(color: Colors.white),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderId),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(SoNo),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(CustomerCode),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(children: [Text(Comments)]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz_sharp),
          ),
        ]);
  }
}
