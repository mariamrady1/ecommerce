class CategoriesDate {
  bool? status;
  String? message;
  ModelDate? data;
  CategoriesDate.fromJson(Map<String, dynamic> date) {
    status = date['status'];
    message = date['message'];
    data = ModelDate.fromJson(date['data']);
  }
}

class ModelDate {
  List<Date> listDate = [];
  ModelDate.fromJson(Map<String, dynamic> date) {
    date['data'].forEach((element) {
      listDate.add(Date.fromJson(element));
    });
  }
}

class Date {
  int? id;
  String? name;
  String? image;

  Date.fromJson(Map<String, dynamic> date) {
    id = date['id'];
    name = date['name'];
    image = date['image'];
  }
}
