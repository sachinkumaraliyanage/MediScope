/*
* File Name: locator.dart
* Author: S.K.Liyanage
* Reg No: IT17152938
* Date: 2020/03/11
* Description: Contains implementation of locator for Firebase connection.
*
* */

import 'package:get_it/get_it.dart';

import 'FirebaseData.dart';
import 'CRUDModel.dart';


GetIt locator = GetIt.instance;

final String firebaseImageUrl = 'gs://mediscope-cfcfc.appspot.com';
final String firebaseImageMainFolder = 'images/';
//locate Firebase connection
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDataApi('Medicine'));
  locator.registerLazySingleton(() => CRUDModel());
}
