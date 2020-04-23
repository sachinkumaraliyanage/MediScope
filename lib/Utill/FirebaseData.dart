//import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/foundation.dart';
//import 'Medicine.dart';
//import 'package:intl/intl.dart';

//sachin kumara Liyanage
//IT17152938

//middleware for CRUDModel and Medicine modal
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

  //fetch all Medicines from Firebase
  Future<QuerySnapshot> getDataCollection() {
    print(FirebaseDataApi.useremail);
    return ref.orderBy("date",descending: true).where("email",isEqualTo: FirebaseDataApi.useremail).getDocuments() ;
  }

  //fetch all Medicines from Firebase as Stream
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }

  //get Medicines by ID
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  //remove Medicines
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }

  //edit Medicines
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  //add Medicines
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }


}

