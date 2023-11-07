import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tsf/components/Cards.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/CardListData.dart';
import 'package:tsf/utils/commonFunctions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background(context, BackgroundImagePath().INNERBACKGROUND),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TopLayer().topLayerWidget("Home", context, visiblity: false),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09,
                        right: MediaQuery.of(context).size.width * 0.09),
                    child: ToggleSwitch(
                      minWidth: MediaQuery.of(context).size.width * 0.4,
                      minHeight: MediaQuery.of(context).size.height * 0.05,
                      initialLabelIndex: 0,
                      cornerRadius: 10.0,
                      activeFgColor: AppColors().white,
                      inactiveBgColor: AppColors().inactiveToggle,
                      inactiveFgColor: AppColors().white,
                      totalSwitches: 2,
                      labels: ["Sales Order", "Dispatch Summary"],
                      borderWidth: 2.0,
                      borderColor: [Colors.blueGrey],
                      activeBgColors: [
                        [AppColors().activeTogleButton],
                        [AppColors().activeTogleButton]
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: FutureBuilder(
                      future: CommonFunctions().getOrders(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              print(snapshot.data[0][0]);
                              return HomeCard().homeCard(
                                  snapshot.data[0][0]['orderId']!,
                                  snapshot.data[0][0]['arrivingTime']!,
                                  snapshot.data[0][0]['orderPlacedTime']!,
                                  snapshot.data[0][0]['priority']!,
                                  context);
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.blue));
                        }
                      }))
            ],
          )
        ],
      ),
    );
  }
}
