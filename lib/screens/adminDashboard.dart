import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:get/get.dart';
import 'package:tsf/screens/adminScreens/NotificationScreen.dart';
import 'package:tsf/screens/adminScreens/dashboard.dart';
import 'package:tsf/screens/adminScreens/priorityRequests.dart';
import 'package:tsf/screens/adminScreens/userRequests.dart';
import 'package:tsf/utils/Constants.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/stateController.dart';

import 'adminScreens/SubAdmins.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarPage(),
    );
  }
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  StateController stateController = Get.put(StateController());
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
    stateController.headline.value = _headline;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'User Comments',
        isSelected: true,
        icon: Icons.assessment,
        onPressed: () =>
            setState(() => stateController.headline.value = 'User Comments'),
      ),
      if (getUserRole() == "Admin")
        CollapsibleItem(
          text: 'Users',
          icon: Icons.people,
          onPressed: () =>
              setState(() => stateController.headline.value = 'Users'),
        ),
      // if(getUserRole()=="Admin")
      CollapsibleItem(
        text: 'Sub Admins',
        icon: Icons.hdr_auto_sharp,
        onPressed: () =>
            setState(() => stateController.headline.value = 'Sub Admins'),
      ),
      CollapsibleItem(
        text: 'Notifications ',
        icon: Icons.notifications,
        onPressed: () =>
            setState(() => stateController.headline.value = 'Notifications'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: false,
        items: _items,
        title: 'TSF',
        bottomPadding: 0,
        body: _body(size, context),
        backgroundColor: Colors.black87,
        selectedTextColor: Colors.white70,
        textStyle: const TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        toggleTitleStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    switch (stateController.headline.value) {
      case "User Comments":
        return PriorityRequests(
          context: context,
        );
      case "Users":
        if (getUserRole() == "Admin") {
          return UserRequests();
        }
        break;
      case "Dashboard":
        return Dashboard(
          context: context,
        );
      case "Sub Admins":
        // if(getUserRole()=="Admin"){
        return SubAdmins();
      // }
      case "Notifications":
        return AdminNotifications(
          context: context,
        );
    }
    return Dashboard();
  }
}
