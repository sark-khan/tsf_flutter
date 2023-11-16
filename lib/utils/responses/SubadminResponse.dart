class SubadminListResponse {
  List<Subadmins>? subadmins;

  SubadminListResponse({this.subadmins});

  SubadminListResponse.fromJson(Map<String, dynamic> json) {
    if (json['subadmins'] != null) {
      subadmins = <Subadmins>[];
      json['subadmins'].forEach((v) {
        subadmins!.add(new Subadmins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subadmins != null) {
      data['subadmins'] = this.subadmins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subadmins {
  bool? isPasswordInsertedByUser;
  String? sId;
  String? email;
  String? name;
  String? password;
  String? role;
  bool? isActivated;
  List<String>? permissions;
  bool? activationRequested;
  bool? accountRejected;
  int? iV;

  Subadmins(
      {this.isPasswordInsertedByUser,
      this.sId,
      this.email,
      this.name,
      this.password,
      this.role,
      this.isActivated,
      this.permissions,
      this.activationRequested,
      this.accountRejected,
      this.iV});

  Subadmins.fromJson(Map<String, dynamic> json) {
    isPasswordInsertedByUser = json['isPasswordInsertedByUser'];
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    role = json['role'];
    isActivated = json['isActivated'];
    permissions = json['permissions'].cast<String>();
    activationRequested = json['activationRequested'];
    accountRejected = json['accountRejected'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPasswordInsertedByUser'] = this.isPasswordInsertedByUser;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['role'] = this.role;
    data['isActivated'] = this.isActivated;
    data['permissions'] = this.permissions;
    data['activationRequested'] = this.activationRequested;
    data['accountRejected'] = this.accountRejected;
    data['__v'] = this.iV;
    return data;
  }
}