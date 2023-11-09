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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Text(TextConstants().HOME),
        ),
        toolbarHeight: 80.0,
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
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleSwitch(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height * 0.05,
                    initialLabelIndex: toggleIndex,
                    cornerRadius: 5.0,
                    activeFgColor: AppColors().white,
                    inactiveBgColor: AppColors().inactiveToggle,
                    inactiveFgColor: AppColors().white,
                    totalSwitches: 2,
                    labels: const ["Sales Order", "Dispatch Summary"],
                    borderWidth: 2.0,
                    borderColor: [Colors.blueGrey],
                    activeBgColors: [
                      [AppColors().activeTogleButton],
                      [AppColors().activeTogleButton],
                    ],
                    onToggle: (index) {
                      setState(() {
                        toggleIndex = index!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                  future: toggleIndex == 0
                      ? CommonFunctions().getOrders()
                      : CommonFunctions().getDispatchList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else {
                      List<dynamic> orders = toggleIndex == 0
                          ? (snapshot.data?["orders"] as List<dynamic>?) ?? []
                          : (snapshot.data?["dispatchList"]
                                  as List<dynamic>?) ??
                              [];

                      if (orders.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              Lottie.asset(
                                'NotFound.json',
                                width: 300,
                                height: 300,
                              ),
                              const Text(
                                "No Orders Found",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: toggleIndex == 0
                                ? HomeCard().homeCard(
                                    orders[index].region!,
                                    orders[index].promiseDate!,
                                    orders[index].requestDate!,
                                    orders[index].soDate!,
                                    orders[index].id!,
                                    context)
                                : HomeCard().dispatchCard(
                                    orders[index].region!,
                                    orders[index].inventoryDate!,
                                    orders[index].soDate!,
                                    orders[index].id!,
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
    );
  }
}
