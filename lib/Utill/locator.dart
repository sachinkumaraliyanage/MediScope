import 'package:get_it/get_it.dart';

import 'FirebaseData.dart';
import 'CRUDModel.dart';
//sachin kumara Liyanage
//IT17152938
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDataApi('Medicine'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}