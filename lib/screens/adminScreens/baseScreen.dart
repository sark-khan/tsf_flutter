import 'package:file_selector/file_selector.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tsf/screens/adminDashboard.dart';
import 'package:tsf/utils/Storage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';

import '../../utils/stateController.dart';

class BaseUI extends StatefulWidget {
  final Widget child;
  final String headline;
  const BaseUI({required this.child, required this.headline, Key? key})
      : super(key: key);
  @override
  State<BaseUI> createState() => _BaseUIState();
  // final _formKey = GlobalKey<FormState>();
}

class _BaseUIState extends State<BaseUI> {
  final _formKey = GlobalKey<FormState>();
  XFile? selectedFile;
  final _emailController = TextEditingController();
  // final _roleController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  final StateController stateController = Get.find<StateController>();
  Future<ReturnObj> _pickFile(BuildContext context) async {
    try {
      final typeGroup = XTypeGroup();
      final file = await openFile(acceptedTypeGroups: [typeGroup]);
      if (file != null) {
        selectedFile = file;
        List<int> fileBytes = await selectedFile!.readAsBytes();
        _isLoading = true;
        Navigator.of(context).pop();
        setState(() {});
        ReturnObj obj = await CommonFunctions().AddUsers(fileBytes);
        _isLoading = false;
        setState(() {});
        return obj;
      } else {
        Navigator.of(context).pop();
        return ReturnObj(message: "No File Selected", status: false);
      }
    } catch (Exception) {
      Navigator.of(context).pop();
      return ReturnObj(message: "No File Selected", status: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _loadingOverlay() {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.5),
        child: AbsorbPointer(
          absorbing: true,
          child: Center(
            child: SpinKitDoubleBounce(
              color: Colors.blue,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth < 500 ? 10 : 100,
              top: 50,
              right: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderRow(context, screenWidth),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.child,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        _isLoading ? _loadingOverlay() : SizedBox.shrink()
      ],
    );
  }

  Widget _buildHeaderRow(BuildContext context, double screenWidth) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.headline,
              style: TextStyle(
                fontSize: screenWidth > 500 ? 40 : 20,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          screenWidth < 600
              ? _buildSmallScreenActions(context)
              : _buildWideScreenActions(context),
        ]);
  }

  Widget _buildSmallScreenActions(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'logout':
            // Perform the logout operation
            Storage.clearUser();
            Navigator.of(context)
                .pushNamed("/login"); // Adjust navigation as needed
            break;
          // Handle other actions if necessary
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          // Add more PopupMenuItem widgets for other actions if needed
          const PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Logout'),
              ],
            ),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert),
    );
  }

  Widget _buildWideScreenActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Check if headline is "User" and display relevant UI components
        if (stateController.headline.value == "User")
          _addUserButton(context), // This is a new method you need to define

        // Existing conditions
        if (stateController.headline.value == "Sub Admins")
          _addSubAdminButton(context),
        _logoutButton(context),
        SizedBox(
          width: 50,
        )
      ],
    );
  }

// Define a new method for "Add User" button (customize as needed)
  Widget _addUserButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        // Implement your logic for adding a user
      },
      color: Colors.blueGrey,
      height: 50,
      child: Text(
        "Add User",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _addSubAdminButton(BuildContext context) {
    return MaterialButton(
      onPressed: () => _showAddSubAdminDialog(context),
      color: Colors.blueGrey,
      height: 50,
      child: Text(
        "Add Sub-Admin",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showAddSubAdminDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text("Add Sub-Admin"),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTextField(_emailController, "Email", Icons.email),
                _buildTextField(_nameController, "Name", Icons.person),
                _buildTextField(_passwordController, "Password", Icons.lock),
                // Include other fields if necessary
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Add"),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                ReturnObj res = await CommonFunctions().AddSubAdmin(
                    _emailController.text,
                    _passwordController.text,
                    _nameController.text);
                Fluttertoast.showToast(msg: res.message);
                _passwordController.text = '';
                _emailController.text = '';
                _nameController.text = '';
                if (res.status) {
                  // _passwordController.text = '';
                  return Navigator.of(context).pop();
                }
                // Implement your logic to add sub-admin
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Storage.clearUser();
        Navigator.of(context)
            .pushNamed("/login"); // Placeholder for actual logout action
        // For example, you might want to navigate to the login screen or clear user data
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, color: Colors.blueGrey),
            SizedBox(width: 8),
            Text("Logout", style: TextStyle(color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }
}
