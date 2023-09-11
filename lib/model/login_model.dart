class ShopLoginModel {
  bool? status;
  String? massage;
  UserData? data;
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? token;
  int? points;
  int? credit;
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
    points = json['points'];
    credit = json['credit'];
  }
}
