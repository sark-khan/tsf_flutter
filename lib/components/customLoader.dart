import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

ProgressDialog customLoader(BuildContext context) {
  ProgressDialog pr = ProgressDialog(context,
      isDismissible: false,
      customBody: const SizedBox(
        child: SpinKitRipple(
          borderWidth: 20,
          color: Colors.white,
          size: 180,
        ),
      ));

  pr.style(
    backgroundColor: Colors.transparent,
  );
  return pr;
}

hasConnectionWrapper(Function callback) {
  return () async {
    callback();
    // return await DataConnectionChecker().hasConnection.then((value) async {
    //   if (value) {
    //     callback();
    //   } else
    //     return Fluttertoast.showToast(msg: 'No Internet Connection');
    // });
  };
}
