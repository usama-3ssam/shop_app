class AddressModel {
  bool? status;
  Data? data;

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class AddressDataModel {
  int? currentPage;
  List data = [];
  String? firstPageUrl;
  int? from;
  int? astPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? lastPage;
  String? prevPageUrl;
  int? to;
  int? total;

  AddressDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add((v));
        currentPage = json['current_page'];
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Data {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
