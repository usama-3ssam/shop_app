class ChangeCartsModel {
  int? id;
  bool? status;
  String? message;
  ChangeCartsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    message = json['message'];
  }
}
