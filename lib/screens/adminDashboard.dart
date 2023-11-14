import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:tsf/screens/adminScreens/Dashboard.dart';
import 'package:tsf/screens/adminScreens/priorityRequests.dart';
import 'package:tsf/screens/adminScreens/userRequests.dart';

import 'adminScreens/SubAdmins.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'Priority Requests',
          icon: Icons.assessment,
          onPressed: () => setState(() => _headline = 'Priority Requests'),

          // isSelected: true,
          ),
      CollapsibleItem(
        text: 'Users',
        icon: Icons.people,
        isSelected: true,
        onPressed: () => setState(() => _headline = 'Users'),

      ),

      CollapsibleItem(
          text: 'Sub Admins',
         icon: Icons.hdr_auto_sharp,
          onPressed: () => setState(() => _headline = 'Sub Admins'),

              ),
              

    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed:false,
        items: _items,
        collapseOnBodyTap: false,
        title: 'TSF',
        showToggleButton: false,
        bottomPadding: 0,
        body: _body(size, context),
        backgroundColor: Colors.black87,
        selectedTextColor: Colors.white70,
        textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.normal , fontWeight: FontWeight.bold),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
  
     switch(_headline){
      case "Priority Requests" :
        return PriorityRequests(context: context,);
        case "Users" :
        return UserRequests();
        case "Dashboard" :
        return Dashboard(context: context,);
        case "Sub Admins" :
        return SubAdmins();

    }
    return Dashboard();
    
  }
}