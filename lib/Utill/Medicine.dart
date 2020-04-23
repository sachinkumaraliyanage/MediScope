//sachin kumara Liyanage
//IT17152938
import 'package:flutter/material.dart';

class Medicine {
  static State<StatefulWidget> s;
  static String imgurl = "";
  String id = "";
  String name;
  String details;
  String date = "";
  String email = "";
  String img = "";

  //constructor with parameters
  Medicine(this.id, this.name, this.details, this.date, this.email, this.img);

  //convert json to Medicine map object
  Medicine.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        details = snapshot['details'] ?? '',
        date = snapshot['date'] ?? '',
        email = snapshot['email'] ?? '',
        img = snapshot['img'] ?? '';

  //convert Medicine object to json
  toJson() {
    return {
      "name": name,
      "details": details,
      "date": date,
      "email": email,
      "img": img,
    };
  }
}
