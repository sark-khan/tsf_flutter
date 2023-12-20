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
  String? sId;
  String? email;
  String? name;
  String? role;
  bool? isActivated;
  Subadmins({
    this.sId,
    this.email,
    this.name,
    this.role,
    this.isActivated,
  });

  Subadmins.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    isActivated = json['isActivated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    data['isActivated'] = this.isActivated;
    return data;
  }
}
