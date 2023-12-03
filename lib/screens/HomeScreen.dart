import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tsf/components/Buttons.dart';
import 'package:tsf/components/Cards.dart';
// import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/utils/AppConstants.dart';
// import 'package:tsf/utils/CardListData.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int toggleIndex = 0;
  Future<ReturnObj>? futureData;

  void initState() {
    super.initState();
    futureData = CommonFunctions().getOrders(); // Default data
  }

  void updateData() {
    setState(() {
      futureData = toggleIndex == 0
          ? CommonFunctions().getOrders()
          : CommonFunctions().getDispatchList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
            child: Text(TextConstants().HOME),
          ),
          toolbarHeight: screenSize.height * 0.1087,
          actions: [
            Buttons().notificationButton(context),
            Buttons().logoutButton(context),
          ],
        ),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Background(context, BackgroundImagePath().INNERBACKGROUND),
            Column(
              children: [
                SizedBox(height: screenSize.height * 0.151315789),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleSwitch(
                      minWidth: MediaQuery.of(context).size.width,
                      minHeight: screenSize.height * 0.0592105263,
                      initialLabelIndex: toggleIndex,
                      cornerRadius: 5.0,
                      activeFgColor: AppColors().white,
                      inactiveBgColor: AppColors().inactiveToggle,
                      inactiveFgColor: AppColors().white,
                      totalSwitches: 2,
                      labels: const ["Sales Order", "Dispatch Summary"],
                      borderWidth: 2.0,
                      // borderColor: [Colors.blueGrey],
                      activeBgColors: [
                        [AppColors().activeTogleButton],
                        [AppColors().activeTogleButton],
                      ],
                      onToggle: (index) {
                        toggleIndex = index!;
                        updateData();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.0131578947,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: futureData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.blue),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else {
                        ReturnObj? ret = snapshot.data;
                        if (!ret!.status) {
                          return Center(
                            child: Text(ret.message),
                          );
                        }
                        List<dynamic>? orders = ret!.data as List<dynamic>;

                        if (orders.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenSize.height * 0.0789473684),
                              child: Column(
                                children: [
                                  Lottie.asset(
                                    'assets/NotFound.json',
                                    width: screenSize.width * 0.694444444,
                                    height: screenSize.height * 0.328947368,
                                  ),
                                  Text(
                                    toggleIndex==0?"No Sales Order Found":"No Dispatch Order Found" ,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.0333333333),
                              child: toggleIndex == 0
                                  ? HomeCard().homeCard(
                                      orders[index].soNumber!,
                                      orders[index].promiseDate!,
                                      orders[index].requestDate!,
                                      orders[index].soDate!,
                                      orders[index].id!,
                                      orders[index].salesOrderLineNumber,
                                      context)
                                  : HomeCard().dispatchCard(
                                      orders[index].soNumber!,
                                      orders[index].inventoryDate!,
                                      orders[index].soDate!,
                                      orders[index].id!,
                                      "orders[index].salesOrderLinerNumber",
                                      context),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
