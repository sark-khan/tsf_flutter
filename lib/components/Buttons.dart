import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/components/pastComments.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/commonFunctions.dart';

class Buttons {
  Widget addCommentsButton(String text, BuildContext context, String orderId) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: IntrinsicWidth(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return showDialogs(context, orderId);
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors().buttonColorPurple),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pastCommentsButton(String text, BuildContext context, String orderId) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: IntrinsicWidth(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return pastCommentDialogBox(context, orderId);
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors().buttonColorPurple),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 0),
      child: FloatingActionButton(
          heroTag: "logoutButton",
          elevation: 0,
          backgroundColor: Colors.transparent,
          // style: ButtonStyle(
          //   elevation: MaterialStateProperty.all(0),
          //   backgroundColor: AppColors(),
          // ),
          onPressed: () {
            Storage.clearUser();
            Navigator.of(context).pushNamed("/login");
          },
          child: Column(
            children: [Icon(Icons.logout), Text("Logout")],
          )),
    );
  }

  Widget notificationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: FloatingActionButton(
          heroTag: "notifButton",
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {
            // if(Navigator.of)
            // Navigator.
            Navigator.of(context).pushNamed("/notification");
          },
          child: const Column(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                size: 32,
              ),
            ],
          )),
    );
  }

  Dialog showDialogs(BuildContext context, String orderId) {
    TextEditingController commentController = TextEditingController();
    FocusNode commentFocusNode = FocusNode();

    void handleSubmit() async {
      ReturnObj response =
          await CommonFunctions().addComments(commentController.text, orderId);
      Fluttertoast.showToast(msg: response.message);
      if (response.status) {
        Navigator.of(context).pop();
      }
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: WillPopScope(
        onWillPop: () async {
          // Prevent the dialog from closing immediately if the text field has focus
          if (commentFocusNode.hasFocus) {
            commentFocusNode.unfocus();
            return false; // Prevent closing the dialog
          }
          return true; // Allow closing the dialog
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Add Comment', style: TextStyle(fontSize: 18.0)),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                FocusScope(
                  child: TextFormField(
                    controller: commentController,
                    focusNode: commentFocusNode,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Comment here...',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors().buttonColorPurple, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors().buttonColorPurple, width: 2.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    maxLines: 5,
                    onFieldSubmitted: (value) {
                      handleSubmit();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors().buttonColorPurple, // Background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 12),
                  ),
                  child: Text(
                    TextConstants().SUBMIT,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
