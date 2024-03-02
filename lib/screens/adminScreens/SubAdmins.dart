// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/SubadminResponse.dart';
import 'package:tsf/utils/responses/UserActivationResponse.dart';

class SubAdmins extends StatefulWidget {
  const SubAdmins({super.key});

  @override
  State<SubAdmins> createState() => _SubAdminsState();
}

class _SubAdminsState extends State<SubAdmins> {
  List<Subadmins> subAdminsList = [];
  bool _isScreenLoading = true;
  bool? getterStatus;
  String subadminSelected = "A";
  @override
  void initState() {
    super.initState();
    FetchSubAdmins();
  }

  FetchSubAdmins() async {
    try {
      ReturnObj returnObj = await CommonFunctions().getSubadminList();
      subAdminsList = returnObj.data;
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
    // bool _isLoading
    return Scaffold(
        body: BaseUI(
            headline: "Sub Admins",
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
                            // height: MediaQuery.of(context).size.height * 0.75,
                            // width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Table(
                                    columnWidths: {
                                      0: FixedColumnWidth(180),
                                      1: FixedColumnWidth(260),
                                      2: FixedColumnWidth(180),
                                      3: FixedColumnWidth(180),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.bottom,
                                    border: TableBorder.all(),
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Role',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Activation Status',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ]),
                                      ...List.generate(
                                        subAdminsList.length,
                                        (index) => _tableRow(
                                          index,
                                          subAdminsList[index].name!,
                                          subAdminsList[index].email!,
                                          subAdminsList[index].role!,
                                          subAdminsList[index].isActivated!,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
              ],
            )));
  }

  TableRow _tableRow(
      int index, String name, String email, String role, bool isActivated) {
    return TableRow(
        decoration: !(index % 2 == 0)
            ? BoxDecoration(color: Colors.blueGrey[50])
            : const BoxDecoration(color: Colors.white),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              role,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isActivated.toString(),
              style: TextStyle(
                  color: isActivated ? Colors.green : Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }
}
