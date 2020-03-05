import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'Medicine.dart';
import 'package:intl/intl.dart';

//sachin kumara Liyanage
//IT17152938

class FirebaseDataApi{
  final  dBref=FirebaseDatabase.instance.reference();
  static String useremail="";

  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  FirebaseDataApi( this.path ) {
    if(ref!=null){
      ref=null;
    }
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }

//  void addData(Medicine m){
//    try{
//      var now = new DateTime.now();
//      String date=new DateFormat("yyyy-MM-dd HH:mm:ss").format(now);
//
//      dBref.child('Medicine').child(setupemail()).push().set(<String,String>{
//        'name':m.name,
//        'details':m.details,
//        'date':date,
//
//      });
//    }catch(e){
//      print(e);
//    }
//
//  }
//
//  void editData(int id,Medicine m){
//
//  }
//
//  void deleteData(int id){
//
//  }
//
//
//  List<Medicine> search(String s) {
//    List<Medicine> all=new List();
//    var a;
//    dBref.
//    dBref.child('Medicine/'+setupemail()).once().asStream().toList().then((value) => print(value.length));
//    print('');
//  }
//
//  Medicine getData(int id){
//
//  }
//
  static String setupemail(){
    return FirebaseDataApi.useremail.replaceAll('.', '_');
  }
//
//  String setupkey(String val){
//    val=val.replaceAll('{-', '');
//    val=val.replaceAll(', -', ', ');
//
//    return val;
//  }

}

