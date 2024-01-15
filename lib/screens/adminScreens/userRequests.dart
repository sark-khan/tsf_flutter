import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/SubadminResponse.dart';
import 'package:tsf/utils/responses/UserActivationResponse.dart';

class UserRequests extends StatefulWidget {
  const UserRequests({Key? key}) : super(key: key);

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
      subAdminNames = subAdminsList
          .map((subadmin) => subadmin.name.toString())
          .toSet()
          .toList();

      _isScreenLoading = false;
      getterStatus = returnObj.status;
      // userActivationRequestList.forEach((element) {
      //   element.selectedSubAdmin = subAdminsList[0].name;
      // });
      setState(() {});
    } catch (e) {
      _isScreenLoading = getterStatus = false;
      print("Error is ${e}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseUI(
        headline: "USER REQUESTS",
        child: _buildUserRequestContent(),
      ),
    );
  }

  Widget _buildUserRequestContent() {
    if (_isScreenLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.grey));
    } else if (!getterStatus!) {
      return Center(child: Text("No Auth Request Found"));
    } else {
      return Expanded(
        child: SingleChildScrollView(
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(5),
              1: FlexColumnWidth(5),
              2: FlexColumnWidth(5),
              3: FlexColumnWidth(5),
              4: FlexColumnWidth(8),
              5: FlexColumnWidth(5)
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border: TableBorder.all(),
            children: [
              _buildTableHeader(),
              ...List.generate(
                userActivationRequestList.length,
                (index) => _tableRow(
                    index,
                    userActivationRequestList[index]
                        .requestCreatedBy
                        .accountNumber,
                    userActivationRequestList[index]
                        .requestCreatedBy
                        .partyName, // Replace with actual data
                    userActivationRequestList[index]
                        .requestCreatedBy
                        .email
                        .split(" ")[0], // Replace with actual data
                    !userActivationRequestList[index].isResponded
                        ? "PENDING"
                        : userActivationRequestList[index].isApproved
                            ? 'ACTIVATED'
                            : 'DEACTIVATED'),
              ),
            ],
          ),
        ),
      );
    }
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildHeaderCell('Customer Code'),
        _buildHeaderCell('User Name'),
        _buildHeaderCell('Email'),
        _buildHeaderCell('Activation Status'),
        _buildHeaderCell('Assign Subadmin'),
        _buildHeaderCell('Action (Activate/Deactivate)'),
      ],
    );
  }

  Padding _buildHeaderCell(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  TableRow _tableRow(int index, String name, String userName,
      String customerCode, String status) {
    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.white : Colors.blueGrey[50],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(customerCode,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w800)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            status,
            style: TextStyle(
              color: status == "PENDING"
                  ? Colors.yellow[900]
                  : status == "ACTIVATED"
                      ? Colors.green
                      : Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildAssignSubadminCell(index, status),
        _buildActionCell(index, status),
      ],
    );
  }

  Widget _buildAssignSubadminCell(int index, String status) {
    Request request = userActivationRequestList[index];
    bool isDropdownEnabled = status != "ACTIVATED" && status != "DEACTIVATED";

    // Ensuring the selectedSubAdmin is in the list of subAdminNames
    String? dropdownValue =
        subAdminNames.contains(request.assignedSubadmin!.name)
            ? request.assignedSubadmin!.name
            : null;

    // If subAdminNames is empty, or selectedSubAdmin is not in subAdminNames, set to null.
    if (subAdminNames.isEmpty || dropdownValue == null) {
      dropdownValue = null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: subAdminNames.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            key: UniqueKey(),
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: isDropdownEnabled
            ? (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    userActivationRequestList[index].assignedSubadmin!.name =
                        newValue;
                  });
                  _assignSubadminToRequest(
                      request.requestCreatedBy.id, newValue);
                }
              }
            : null,
        hint: dropdownValue == null ? Text('Select Subadmin') : null,
      ),
    );
  }

  Widget _buildActionCell(int index, String status) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8,
        children: [
          if (status != "ACTIVATED")
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () => _activateUser(index),
            ),
          if (status != "DEACTIVATED")
            IconButton(
              icon: Icon(Icons.close, color: Colors.redAccent),
              onPressed: () => _deactivateUser(index),
            ),
        ],
      ),
    );
  }

  void _activateUser(int index) async {
    // Assuming each request has a unique identifier
    String requestId = userActivationRequestList[index].id;

    try {
      // Call the function to activate the user
      ReturnObj result = await CommonFunctions().activateUser(
          isApproved: true,
          authRequestId: requestId); // Replace with your actual method

      // Show a toast with the result
      Fluttertoast.showToast(msg: result.message);

      // Refresh the data to reflect the changes
      await getActivationRequests();
    } catch (e) {
      // Handle any errors here
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  void _deactivateUser(int index) async {
    // Assuming each request has a unique identifier
    String requestId = userActivationRequestList[index].id;

    try {
      // Call the function to deactivate the user
      ReturnObj result = await CommonFunctions().activateUser(
          isApproved: false,
          authRequestId:
              requestId); // Adjust this method as per your implementation

      // Show a toast with the result
      Fluttertoast.showToast(msg: result.message);

      // Refresh the data to reflect the changes
      await getActivationRequests();
    } catch (e) {
      // Handle any errors here
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  Future<void> _assignSubadminToRequest(
      String requestId, String subadminName) async {
    // Find the subadmin's ID based on the name
    String? subadminId = subAdminsList
        .firstWhere(
          (subadmin) => subadmin.name == subadminName,
        )
        ?.sId;

    if (subadminId != null) {
      try {
        // Assuming you have a function in CommonFunctions to assign the subadmin
        ReturnObj result =
            await CommonFunctions().assignSubadmin(requestId, subadminId);

        // Display the result message
        Fluttertoast.showToast(msg: result.message);

        // Refresh the data if necessary
        await getActivationRequests();
      } catch (e) {
        // Handle any errors here
        Fluttertoast.showToast(msg: "Error: $e");
      }
    } else {
      // Handle the case where the subadmin is not found
      Fluttertoast.showToast(msg: "Subadmin not found");
    }
  }

// Additional methods like _buildAssignSubadminCell and _buildActionCell
  // ...
}
