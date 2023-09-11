class HomeModel {
  bool? status;
  late HomeDataModel data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List banners = [];
  List products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(element);
    });

    json['products'].forEach((element) {
      products.add(element);
    });
  }
}

class BannerModel {
  int? id;
  dynamic image;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  String? images;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old-price'];
    discount = json['discount'];
    image = json['image'];
    images = json['images'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
