import 'package:get_storage/get_storage.dart';

class Storage {
  static final box = GetStorage();

  static setUser(dynamic us) {
    box.write('user', us);
  }

  // static setLoginDetails(String accountNumberOrEmail, String password) {
  //   box.write('details',
  //       {"accountNumberOrEmail": accountNumberOrEmail, "password": password});
  // }

  static getUser() {
    if (box.hasData('user')) {
      return box.read('user');
    } else {
      return false;
    }
  }

  static dynamic getLoginDetails() {
    return box.read('details') ?? false;
  }

  static clearUser() {
    box.erase();
  }

  // static setBlockBackNavigation(bool u) {
  //   box.write('page', u);
  // }

  // static getPage() {
  //   return box.read('page') ?? false;
  // }

  static addJwtToken(String token) {
    box.write('token', token);
  }

  static getJwtToken() {
    return box.read('token') ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIm5hbWUiOiJBZG1pbl9sb2NhbCIsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6IjY1MjNhYTg5ODkyYzY0ZWM5YTk3NzU4YyIsImlhdCI6MTY5OTk1ODEyNn0.7foC-16fpMdFEtCRXcE8bjyqeBX_jgkxLJM1h8IOPuQ";
  }
}
