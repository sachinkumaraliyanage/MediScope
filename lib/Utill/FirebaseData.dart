import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'Medicine.dart';
import 'package:intl/intl.dart';

//sachin kumara Liyanage
//IT17152938

class FirebaseDataApi{

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
    print(FirebaseDataApi.useremail);
    return ref.orderBy("date",descending: true).where("email",isEqualTo: FirebaseDataApi.useremail).getDocuments() ;
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


}

