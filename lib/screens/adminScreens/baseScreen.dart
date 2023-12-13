import 'package:tsf/utils/Storage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';

import '../../utils/stateController.dart';

class BaseUI extends StatelessWidget {
  final Widget child;
  final String headline;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _roleController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  BaseUI({required this.child, required this.headline, Key? key}) : super(key: key);

  final StateController stateController = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth < 500 ? 20 : 220,
          top: 50,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow(context, screenWidth),
            Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            headline,
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        screenWidth < 600 ? _buildSmallScreenActions(context) : _buildWideScreenActions(context),
      ],
    );
  }

  Widget _buildSmallScreenActions(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        // Actions for smaller screens
      },
    );
  }

  Widget _buildWideScreenActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (stateController.headline.value == "Sub Admins") _addSubAdminButton(context),
        _logoutButton(context),
      ],
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
            onPressed: () async{
              if (_formKey.currentState!.validate()) {
                ReturnObj res =   await CommonFunctions().AddSubAdmin(_emailController.text, _passwordController.text, _nameController.text);
                Fluttertoast.showToast(msg: res.message);
                _passwordController.text = '';
                _emailController.text='';
                _nameController.text='';
                if(res.status){
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

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
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
        Navigator.of(context).pushNamed("/login"); // Placeholder for actual logout action
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
