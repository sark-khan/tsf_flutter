class CommonFunctions {
  ReturnObj validateLogin(String email, String password) {
    try {
      if (email.isEmpty || password.isEmpty) {
        return ReturnObj(
            message: "Please Enter the Email/Password", status: false);
      }
      return ReturnObj(message: "SuccessFullLogin", status: true);
    } catch (exception) {
      return ReturnObj(message: "Error", status: false);
    }
  }
}

class ReturnObj {
  bool status;
  String message;
  ReturnObj({required this.message, required this.status});
}
