/*
* File Name: Medicine.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/11
* Description: Contains model implementation of all the medicines functions.
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* */

import 'package:flutter/material.dart';

/*
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* Some of the code snippets of the above github code were adjusted and used for below class.
**/

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
