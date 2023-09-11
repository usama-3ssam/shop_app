class CategoriesModels {
  bool? status;
  late CategoriesDataModels? data;

  CategoriesModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModels.fromJson(json['data']);
  }
}

class CategoriesDataModels {
  int? currentPage;
  List data = [];

  CategoriesDataModels.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int? id;
  String? name;
  dynamic image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
