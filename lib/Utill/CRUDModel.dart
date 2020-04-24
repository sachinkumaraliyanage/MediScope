/*
* File Name: CRUDModel.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/11
* Description: Contains model implementation of all the crud functions.
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* */

import 'Medicine.dart';
import 'package:flutter/material.dart';
import 'FirebaseData.dart';
import 'locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* Some of the code snippets of the above github code were adjusted and used for below class.
**/
class CRUDModel extends ChangeNotifier {
  FirebaseDataApi _api = locator<FirebaseDataApi>();

  List<Medicine> products;

  //fetch all Medicines from Firebase
  Future<List<Medicine>> fetchMedicines() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Medicine.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  //fetch all Medicines from Firebase as Stream
  Stream<QuerySnapshot> fetchMedicinesAsStream() {
    return _api.streamDataCollection();
  }

  //get Medicines by ID
  Future<Medicine> getMedicineById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Medicine.fromMap(doc.data, doc.documentID);
  }

  //remove Medicines
  Future removeMedicine(String id) async {
    await _api.removeDocument(id);
    return;
  }

  //edit Medicines
  Future updateMedicine(Medicine data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  //add Medicines
  Future addMedicine(Medicine data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}
