import 'Medicine.dart';
import 'package:flutter/material.dart';
import 'FirebaseData.dart';
import 'locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//sachin kumara Liyanage
//IT17152938
class CRUDModel extends ChangeNotifier {
  FirebaseDataApi _api = locator<FirebaseDataApi>();

  List<Medicine> products;


  Future<List<Medicine>> fetchMedicines() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Medicine.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchMedicinesAsStream() {
    return _api.streamDataCollection();
  }

  Future<Medicine> getMedicineById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Medicine.fromMap(doc.data, doc.documentID) ;
  }


  Future removeMedicine(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateMedicine(Medicine data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addMedicine(Medicine data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}