import 'dart:convert';

DateMdel1 dateMdel1FromMap(String str) => DateMdel1.fromMap(json.decode(str));

String dateMdel1ToMap(DateMdel1 data) => json.encode(data.toMap());

class DateMdel1 {
  final bool? status;
  final String? message;
  final Data? data;

  DateMdel1({
    this.status,
    this.message,
    this.data,
  });

  factory DateMdel1.fromMap(Map<String, dynamic> json) => DateMdel1(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final String? email;
  final String? name;
  final String? phone;
  final int? id;
  final String? image;
  final String? token;

  Data({
    this.email,
    this.name,
    this.phone,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        id: json["id"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "phone": phone,
        "id": id,
        "image": image,
        "token": token,
      };
}
