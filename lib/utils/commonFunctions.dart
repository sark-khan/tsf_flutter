import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/responses/CheckUser.dart';
import 'package:tsf/utils/responses/DispatchListResponse.dart';
import 'package:tsf/utils/responses/GetComments.dart';
import 'package:tsf/utils/responses/LoginResponse.dart';
import 'package:tsf/utils/responses/NotificationResponse.dart';
import 'package:tsf/utils/responses/SingleDispatchDetails.dart';
import 'package:tsf/utils/responses/SingleOrderDetailsResponse.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';
import 'package:tsf/utils/responses/SubadminResponse.dart';

import 'responses/UserActivationResponse.dart';

class CommonFunctions {
  static Dio dio = Dio();
  static String APIURL = "http://192.168.10.10:2000";
  static var headers = {'Content-Type': 'application/json'};

  Future<ReturnObj> Login(String email, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode(
          {"accountNumberOrEmail": email.toLowerCase(), "password": password});
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
        return ReturnObj(status: true, message: "Logged in Successfully");
      }
      return ReturnObj(message: TextConstants().SERVER_BUSY, status: false);
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        return ReturnObj(status: false, message: "Password did not Match");
      }
      return ReturnObj(message: TextConstants().SERVER_BUSY, status: false);
    } catch (error) {
      printError(info: "Error in Login $error");
      return ReturnObj(status: false, message: "Login UnSuccessfull");
    }
  }

  Future<ReturnObj> AddSubAdmin(
      String email, String password, String name) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({
        "email": email.toLowerCase(),
        "password": password,
        "name": name,
        "role": "Subadmin"
      });
      var dio = Dio();
      var response = await dio.request(
        '$APIURL/api/auth/register',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return ReturnObj(status: true, message: response.data["message"]);
      }
      return ReturnObj(message: TextConstants().SERVER_BUSY, status: false);
    } on DioException catch (e) {
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      printError(info: "Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj> CheckUser(String accountNumberOrEmail) async {
    try {
      if (accountNumberOrEmail.isEmpty) {
        return ReturnObj(message: "Please Enter the Email", status: false);
      }
      var bodyData = json
          .encode({"accountNumberOrEmail": accountNumberOrEmail.toLowerCase()});
      print("here in check User");
      var response = await dio.request(
        "$APIURL/api/auth/check-user",
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: bodyData,
      );
      print("${response.data} helloooooo status");
      if (response.statusCode == 200) {
        CheckUserResponse checkUserResponse =
            CheckUserResponse.fromJson(response.data);
        if (checkUserResponse.userVerified) {
          return ReturnObj(status: true, message: "Enter Password");
        }
        if (checkUserResponse.accountRejected) {
          return ReturnObj(message: "Account is ", status: false);
        }
        if (checkUserResponse.activationRequested) {
          return ReturnObj(status: false, message: "Activation Request Sent");
        }
        if (checkUserResponse.isRequestSent) {
          return ReturnObj(status: false, message: "Waiting for Approval");
        }
        if (checkUserResponse.insertNewPassword) {
          return ReturnObj(message: response.data['message'], status: true);
        }
      }
      return ReturnObj(status: false, message: "Server is Busy");
    } on DioException catch (e) {
      print("${e.response} helloooooo status check");
      if (e.response!.statusCode == 401) {
        return ReturnObj(status: false, message: "Your account is Rejected");
      }
      if (e.response!.statusCode == 404) {
        return ReturnObj(status: false, message: "User not Found");
      }
      return ReturnObj(status: false, message: TextConstants().SERVER_BUSY);
    } catch (error) {
      print("Error inn CheckUser $error");
      return ReturnObj(message: TextConstants().SERVER_BUSY, status: false);
    }
  }

  Future<ReturnObj> getOrderDetails(String? orderId) async {
    try {
      if (orderId!.isEmpty) {
        return ReturnObj(
            message: "Error in get Particular Details", status: false);
      }
      // headers['token'] =
      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IkFMVS0xMjMiLCJpYXQiOjE2OTk3MDAzMjl9.Q-kM19JFfPX8OgGHk6O0P8acA2o1Yse7dbHSS7py_T0";

      headers['token'] = Storage.getJwtToken();
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
        return ReturnObj<SingleOrderDetails>(
            message: "Received Successfully",
            status: true,
            data: orderDetailsResponse.singleOrderDetails);
        // {"orderDetails": orderDetailsResponse.singleOrderDetails};
      } else {
        return ReturnObj(
            message: "Unable to get the Dispatch Details", status: false);
      }
    } catch (error) {
      printError(info: "Error in Order Details $error");
      return ReturnObj(message: "Server is Busy", status: false);
    }
  }

  Future<ReturnObj> getDispatchDetails(String? orderId) async {
    try {
      if (orderId!.isEmpty) {
        return ReturnObj(
            message: "Error in getting Particular Details", status: false);
      }
      headers['token'] = Storage.getJwtToken();

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
        return ReturnObj<DispatchDetails>(
            message: "Received Successfully",
            status: true,
            data: dispatchDetailsResponse.dispatchDetails);
        // {"dispatchDetails": dispatchDetailsResponse.dispatchDetails};
      } else {
        return ReturnObj(
            message: "Unable to get Dispatch Details", status: false);
      }
    } catch (error) {
      printError(info: "Error inn Order Details $error");
      return ReturnObj(message: "Server is Busy", status: false);
    }
  }

    Future<ReturnObj> getComments() async {
    try {
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/order/order-comments',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        GetCommentsResponse commentsMap = GetCommentsResponse.fromJson(response.data);
        return ReturnObj<List<GetOrderCommentsDetail>>(
            message: "Comments Received Successfully",
            status: true,
            data: commentsMap.getOrderCommentsDetails);

      } else {
        return ReturnObj(message: "Server is Busy", status: false);
      }
    } catch (error) {
      printError(info: "Error In getOrders $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }


  Future<ReturnObj> getOrders() async {
    try {
      headers['token'] = Storage.getJwtToken();
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
        return ReturnObj<List<Order>>(
            message: "Order Received Successfully",
            status: true,
            data: ordersMap.orders);

        // return {
        //   "orders": ordersMap.orders,
        // };
      } else {
        return ReturnObj(message: "Server is Busy", status: false);
      }
    } catch (error) {
      printError(info: "Error In getOrders $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }

  Future<ReturnObj> addComments(String comment, String orderId) async {
    try {
      headers['token'] = Storage.getJwtToken();
      var data = json.encode({"orderId": orderId, "comment": comment});

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
      printError(info: "Error in add Comments $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }

  Future<ReturnObj> getNotifications() async {
    try {
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/notification/all-notifications',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        NotificationResponse notifResponse =
            NotificationResponse.fromJson(response.data);
        return ReturnObj<List<Message>>(
            message: "Notification received",
            status: true,
            data: notifResponse.message);
      }
      return ReturnObj(message: "Unable to get notifications", status: false);
    } catch (error) {
      printError(info: "Error in getNotifications $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }

  Future<ReturnObj> getDispatchList() async {
    try {
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
        print("${response.data} hellloooo");
        DispatchListResponse dispatchList =
            DispatchListResponse.fromJson(response.data);
        return ReturnObj<List<DispatchList>>(
            message: "Received Successfully",
            status: true,
            data: dispatchList.dispatchList);
      }
      return ReturnObj(message: "Unable to get Dispatch List", status: false);
    } catch (error) {
      printError(info: "Error in Dispatch List $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }

  Future<ReturnObj> activateUser(
      {String? authRequestId, bool? isApproved}) async {
    try {
      var data = json
          .encode({"authRequestId": authRequestId, "isApproved": isApproved});
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/auth/user-activation',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      return ReturnObj(
        message: response.data["message"],
        status: response.statusCode == 200 ? true : false,
      );
    } on DioException catch (e) {
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      printError(info: "Error in User Activation $error");
      return ReturnObj(status: false, message: "Internal Server Error");
    }
  }

  Future<ReturnObj> getUserActivationRequests() async {
    try {
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/auth/user-activation-requests',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        // data: data,
      );
      if (response.statusCode == 200) {
        UserActivationResponse userActivationResponse =
            UserActivationResponse.fromJson(response.data);
        return ReturnObj<List<Request>>(
            message: "Received Successfully",
            status: true,
            data: userActivationResponse.requests);
      }
      return ReturnObj(
          message: "Unable to get Activation List", status: false, data: []);
    } catch (error) {
      printError(info: "Unable to get Activation List $error");
      return ReturnObj(
          status: false, message: "Internal Server Error", data: []);
    }
  }

    Future<ReturnObj> assignSubadmin(String userID , String subadminId) async {
    try {
      headers['token'] = Storage.getJwtToken();
      var data = json.encode({
  "userId":userID,
  "subadminId": subadminId
});
      var response = await dio.request(
        '$APIURL/api/auth/add-subadmin-to-user',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {

        return ReturnObj(
            message: response.data["message"],
            status: true,
          );
      }
      return ReturnObj(
             message: response.data["message"], status: false, data: []);
    } catch (error) {
      printError(info: "Unable to get Activation List $error");
      return ReturnObj(
          status: false, message: "Internal Server Error", );
    }
  }

  Future<ReturnObj> getSubadminList() async {
    try {
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/auth/subadmin-list',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        SubadminListResponse subadminListResponse =
            SubadminListResponse.fromJson(response.data);
        return ReturnObj<List<Subadmins>>(
            message: "Received Successfully",
            status: true,
            data: subadminListResponse.subadmins);
      }
      return ReturnObj(
          message: "Unable to fetch Subadmins List", status: false, data: []);
    } catch (error) {
      printError(info: "Unable to get Subadmins List $error");
      return ReturnObj(
          status: false, message: "Internal Server Error", data: []);
    }
  }


}

class ReturnObj<T> {
  bool status;
  String message;
  T? data;
  ReturnObj({required this.message, required this.status, this.data});
}

String getUserRole() => Jwt.parseJwt(Storage.getJwtToken())['role'];
