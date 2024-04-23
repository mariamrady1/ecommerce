class ItemsModel {
  late bool status;
  String? message;
  ItemsList? itemData;
  ItemsModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
    itemData = ItemsList.fromJson(data['data']);
  }
}

class ItemsList {
  List<BannerModel> banner = [];
  List<ProductModel> products = [];

  ItemsList.fromJson(Map<String, dynamic> data) {
    data['banners'].forEach((element) {
      banner.add(BannerModel.fromJson(element));
    });
    data['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int? id;
  String? image;
  String? category;
  String? product;

  BannerModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
    category = data['category'];
    product = data['product'];
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  var price;
  var oldPrice;
  int? discount;
  List? images;

  ProductModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    image = data['image'];
    price = data['price'];
    oldPrice = data['old_price'];
    discount = data['discount'];
    images = data['images'];
  }
}
