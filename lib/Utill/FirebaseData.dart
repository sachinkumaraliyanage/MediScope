/*
* File Name: FirebaseData.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/11
* Description: Contains implementation of firebase manipulations for crud functions.Act as a middleware for CRUDModel and Medicine modal.
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* */


//import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/foundation.dart';
//import 'Medicine.dart';
//import 'package:intl/intl.dart';

/*
* Reference: ProductAppCourse, July. 29, 2019. Accessed on: March. 10, 2020.[online]. https://github.com/mohamedHassanKa/ProductAppCourse
*
* Some of the code snippets of the above github code were adjusted and used for below class.
**/

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

