import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/commonFunctions.dart';

class Buttons {
  Widget addCommentsButton(String text, BuildContext context, String orderId) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return showDialogs(context, orderId);
            },
          );
        },
        child: Text(text, style: TextStyle(fontSize: 12),),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors().buttonColorPurple)
            ,
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, top: 25, bottom: 20, left: 0),
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
            children: [Icon(Icons.logout)],
          )),
    );
  }

  Widget notificationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
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
              Icon(Icons.notifications_none_outlined),

            ],
          )),
    );
  }

  Dialog showDialogs(BuildContext context, String orderId) {
    TextEditingController commentController = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.only(top:12,left:20, right:20, bottom:20),
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

            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Enter Your Comment here...',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors().buttonColorPurple, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors().buttonColorPurple, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              // minLines: 3,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                ReturnObj response = await CommonFunctions()
                    .addComments(commentController.text, orderId);
                // if(response.status){
                Fluttertoast.showToast(msg: response.message);
                if(response.status){
                  Navigator.of(context)
                      .pop();
                }
                // This will close the dialog box when the 'x' button is pressed

                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors().buttonColorPurple, // Background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              ),
              child: Text(TextConstants().SUBMIT),
            ),
          ],
        ),
      ),
    );
  }
}
