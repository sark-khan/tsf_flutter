import 'dart:convert';
// import 'dart:html';
// import 'dart:js_interop';

import 'package:dio/dio.dart';
// import 'package:tsf/screens/OrderDetails.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/responses/CheckUser.dart';
import 'package:tsf/utils/responses/DispatchListResponse.dart';
import 'package:tsf/utils/responses/LoginResponse.dart';
import 'package:tsf/utils/responses/NotificationResponse.dart';
import 'package:tsf/utils/responses/SingleDispatchDetails.dart';
import 'package:tsf/utils/responses/SingleOrderDetailsResponse.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';

class CommonFunctions {
  static Dio dio = Dio();
  static String APIURL = "http://192.168.10.10:2000";
  static var headers = {'Content-Type': 'application/json'};

  static Future<dynamic> Login(String email, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data =
          json.encode({"accountNumberOrEmail": email, "password": password});
      var dio = Dio();
      var response = await dio.request(
        '$APIURL/api/auth/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Storage.addJwtToken(loginResponse.token);
        print(Storage.getJwtToken());
        return ReturnObj(status: true, message: "Login Successfull");
      } else {
        return ReturnObj(status: false, message: "Credintials did not match");
      }
    } catch (error) {
      print("error is $error");
      return ReturnObj(status: false, message: "Login Unsuccessfull");
    }
  }

  Future<dynamic> getOrderDetails(String? orderId) async {
    try {
      if (orderId!.isEmpty) {
        return ReturnObj(
            message: "Error in get Particular Details", status: false);
      }
      headers['token'] = Storage.getJwtToken();
      // headers['token'] =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IjEyMzQ1Njc4OTAiLCJpYXQiOjE2OTk0MzQzNDJ9.NH5get8DFsvRVEOomA4lbyGQyVVQd6uEbLbFqkVxMPY";

      var data = json.encode({"orderId": orderId});
      var response = await dio.request(
        '$APIURL/api/order/get-order-details',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        SingleOrderDetailsResponse orderDetailsResponse =
            SingleOrderDetailsResponse.fromJson(response.data);
        return {"orderDetails": orderDetailsResponse.singleOrderDetails};
      } else {
        return {"orderDetails": []};
      }
    } catch (error) {
      print("error inn Order Details $error");
      return {"orderDetails": []};
    }
  }

  Future<dynamic> getDispatchDetails(String? orderId) async {
    try {
      if (orderId!.isEmpty) {
        return ReturnObj(
            message: "Error in getting Particular Details", status: false);
      }
      headers['token'] = Storage.getJwtToken();
      // headers['token'] =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IjEyMzQ1Njc4OTAiLCJpYXQiOjE2OTk0MzQzNDJ9.NH5get8DFsvRVEOomA4lbyGQyVVQd6uEbLbFqkVxMPY";

      var data = json.encode({"orderId": orderId});
      var response = await dio.request(
        '$APIURL/api/order/get-dispatch-details',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        SingleDispatchDetails dispatchDetailsResponse =
            SingleDispatchDetails.fromJson(response.data);
        return {"dispatchDetails": dispatchDetailsResponse.dispatchDetails};
      } else {
        return {"dispatchDetails": []};
      }
    } catch (error) {
      print("error inn Order Details $error");
      return {"dispatchDetails": []};
    }
  }

  static Future<ReturnObj> CheckUser(String accountNumberOrEmail) async {
    try {
      if (accountNumberOrEmail.isEmpty) {
        return ReturnObj(message: "Please Enter the Email", status: false);
      }
      var headers = {
        'Content-Type': 'application/json',
      };
      var bodyData =
          json.encode({"accountNumberOrEmail": accountNumberOrEmail});
      var response = await dio.request(
        "$APIURL/api/auth/check-user",
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: bodyData,
      );
      if (response.statusCode == 200) {
        CheckUserResponse _checkUserResponse =
            CheckUserResponse.fromJson(response.data);
        if (_checkUserResponse.accountRejected) {
          return ReturnObj(message: "Account is ", status: false);
        }
        if (_checkUserResponse.activationRequested) {
          return ReturnObj(status: false, message: "Activation Request Sent");
        }
        if (_checkUserResponse.isRequestSent) {
          return ReturnObj(status: false, message: "Waiting for Approval");
        }
        if (_checkUserResponse.insertNewPassword) {
          return ReturnObj(message: "Insert New Message", status: true);
        }
        return ReturnObj(status: true, message: "Enter Password");
      } else if (response.statusCode == 400) {
        return ReturnObj(message: "Bad Request", status: false);
      } else {
        if (response.statusCode == 404) {
          return ReturnObj(message: "User Not Found", status: false);
        }
        return ReturnObj(status: false, message: "User Does not exists");
      }
    } catch (error) {
      print("error inn CheckUser $error");
      return ReturnObj(status: false, message: "Login UnSuccessfull");
    }
  }

  Future<dynamic> getOrders() async {
    headers['token'] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IkFMVS0xMjMiLCJpYXQiOjE2OTk1Mzg1MjZ9.kNChfU7qtxFJw8SmaSNGklEw3u90TvEDk_6kxnOqg6g";
    var data = json.encode({"limit": "123", "skip": "0"});
    var response = await dio.request(
      '$APIURL/api/order/get-order-list',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      OrderListResponse ordersMap = OrderListResponse.fromJson(response.data);
      return {
        "orders": ordersMap.orders,
      };
    } else {
      return {"orders": []};
    }
  }

  Future<dynamic> addComments(String comment) async {
    try {
      headers['token'] = Storage.getJwtToken();
      var data = json
          .encode({"orderId": "654bb54d84df9569eb656a85", "comment": comment});

      var response = await dio.request(
        '$APIURL/api/order/order-comments',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        return ReturnObj(message: "Comment sent Successfully", status: true);
      }
      return ReturnObj(message: "unable to send Comments", status: false);
    } catch (error) {
      print("error in add Comments $error");
      return ReturnObj(status: false, message: "Unable to send Comments");
    }
  }

  Future<dynamic> getNotifications() async {
    try {
      // headers['token'] =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IkFMVS0xMjMiLCJpYXQiOjE2OTk0NjA0NzB9.e1vItg5J9tKsWUp9s9jDv0mVSRYoam_anHflSOaiu-g";
      headers['token'] = Storage.getJwtToken();
      // var data = json
      //     .encode({"orderId": "654bb54d84df9569eb656a85", "comment": comment});

      var response = await dio.request(
        '$APIURL/api/notification/all-notifications',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        // data: data,
      );
      if (response.statusCode == 200) {
        NotificationResponse notifResponse =
            NotificationResponse.fromJson(response.data);
        return {"notifications": notifResponse.message};
      }
      return ReturnObj(message: "unable to send Comments", status: false);
    } catch (error) {
      print("error in add Comments $error");
      return ReturnObj(status: false, message: "Unable to send Comments");
    }
  }

  Future<dynamic> getDispatchList() async {
    try {
      // headers['token'] =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IkFMVS0xMjMiLCJpYXQiOjE2OTk0NjA0NzB9.e1vItg5J9tKsWUp9s9jDv0mVSRYoam_anHflSOaiu-g";
      headers['token'] = Storage.getJwtToken();

      var response = await dio.request(
        '$APIURL/api/order/get-dispatch-list',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        // data: data,
      );
      if (response.statusCode == 200) {
        DispatchListResponse notifResponse =
            DispatchListResponse.fromJson(response.data);
        return {"dispatchList": notifResponse.dispatchDetails};
      }
      return ReturnObj(message: "unable to send Comments", status: false);
    } catch (error) {
      print("error in add Comments $error");
      return ReturnObj(status: false, message: "Unable to send Comments");
    }
  }
}

class ReturnObj {
  bool status;
  String message;
  ReturnObj({required this.message, required this.status});
}
