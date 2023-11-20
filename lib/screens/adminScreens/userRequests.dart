// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/SubadminResponse.dart';
import 'package:tsf/utils/responses/UserActivationResponse.dart';

class UserRequests extends StatefulWidget {
  const UserRequests({super.key});

  @override
  State<UserRequests> createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  List<Request> userActivationRequestList = [];
    List<Subadmins> subAdminsList = [];
  List<String> subAdminNames = [];
  bool _isScreenLoading = true;
  bool? getterStatus;
 
  @override
  void initState() {
    super.initState();
    getActivationRequests();
  }


  getActivationRequests() async {
    try {
      ReturnObj returnObj2 = await CommonFunctions().getSubadminList();
      ReturnObj returnObj = await CommonFunctions().getUserActivationRequests();
      userActivationRequestList = returnObj.data;
      subAdminsList = returnObj2.data;
      subAdminNames =  subAdminsList.map((subadmin) => subadmin.name.toString()).toList();
      _isScreenLoading = false;
      getterStatus = returnObj.status;
      userActivationRequestList.forEach((element) {
        element.selectedSubAdmin = subAdminsList[0].name;
      });
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
            headline: "USER REQUESTS",
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
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              child: Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(5),
                                    1: FlexColumnWidth(5),
                                    2: FlexColumnWidth(5),
                                    3: FlexColumnWidth(5),
                                    4: FlexColumnWidth(8  ),
                                    5:FlexColumnWidth(5)
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.bottom,
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Customer Code',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'User Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Email',
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Assign Subadmin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ), 
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Action (Activate/Deactivate)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                          
      
                                    
                                    ]),
                                    ...List.generate(
                                      userActivationRequestList.length,
                                      (index) => _tableRow(
                                          index,
                                          userActivationRequestList[index]
                                                  .requestCreatedBy.accountNumber,
                                          "Ankit04",
                                          "ankit@webmobsoft.com",
                                          !userActivationRequestList[index]
                                                  .isResponded
                                              ? "PENDING"
                                              : userActivationRequestList[index]
                                                      .isApproved
                                                  ? 'ACTIVATED'
                                                  : 'DEACTIVATED'),
                                    )
                                  ]),
                            ),
                          ),
              ],
            )));
  }

  TableRow _tableRow(int index, String name, String userName,
      String CustomerCode, String Status) {

    return TableRow(
        decoration: !(index % 2 == 0)
            ? BoxDecoration(color: Colors.blueGrey[50])
            : const BoxDecoration(color: Colors.white),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name , style: TextStyle(color: Colors.black , fontSize: 15 , fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userName , style: TextStyle(color: Colors.black , fontSize: 15 , fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(CustomerCode , style: TextStyle(color: Colors.grey[600] , fontSize: 15 , fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Status,
              style: TextStyle(
                  color: Status == "PENDING"
                      ? Colors.yellow[900]
                      : Status == "ACTIVATED"
                          ? Colors.green
                          : Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          userActivationRequestList[index].assignedSubadmin != null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("${userActivationRequestList[index].assignedSubadmin?.name.toString()}"  , style: TextStyle(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold),)),
          ):
 Padding(
          padding: const EdgeInsets.only(left:20.0, right:20),
          child: DropdownButton( 
            key:Key(userActivationRequestList[index].id.toString()) ,
                value: userActivationRequestList[index].selectedSubAdmin, 
                icon: const Icon(Icons.keyboard_arrow_down),    
     
                items: subAdminNames.map((String item) { 
                  return DropdownMenuItem( 
                    value: item, 
                    child: Text(item), 
                  ); 
                }).toList(), 
        
                onChanged: (String? newValue)async {  
                
                   Subadmins sb =  subAdminsList.firstWhere((element) => element.name == newValue);

                    ReturnObj obj =   await  CommonFunctions().assignSubadmin(userActivationRequestList[index].requestCreatedBy.id, sb.sId.toString());
                    Fluttertoast.showToast(msg: obj.message);
                    getActivationRequests();
                    setState(() {
                      
                    });
                }, 
              ),
        ), 
          userActivationRequestList[index].isStatusLoading == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Wrap(
                      spacing: 1,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center ,
                      children: [
                           !(Status == "ACTIVATED")?
                        RawMaterialButton(
                          
                        onPressed:  () async {
                            userActivationRequestList[index].isStatusLoading =
                                true;
                                     setState(() {});
                            ReturnObj res = await CommonFunctions()
                                .activateUser(
                                    isApproved: true,
                                    authRequestId:
                                        userActivationRequestList[index].id);
                            getActivationRequests();
                            Fluttertoast.showToast(msg: res.message);
                          },
                          elevation: 2.0,
                          fillColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            size: 15.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                        ):Container(),
                         !( Status == "DEACTIVATED")?
                        RawMaterialButton(
                          onPressed:  () async {
                            userActivationRequestList[index].isStatusLoading =
                                true;
                                     setState(() {});
                            ReturnObj res = await CommonFunctions()
                                .activateUser(
                                    isApproved: false,
                                    authRequestId:
                                        userActivationRequestList[index].id);
                            getActivationRequests();
                              Fluttertoast.showToast(msg: res.message);
                          },
                          elevation: 2.0,
                          fillColor: Colors.redAccent,
                          child: Icon(
                            Icons.close,
                            size: 15.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                        ): Container()
                      ],
                    ),
                  ),
                ),
       
        
        ]);
  }
}
