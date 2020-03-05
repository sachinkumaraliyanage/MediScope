import 'package:get_it/get_it.dart';

import 'FirebaseData.dart';
import 'CRUDModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDataApi('Medicine'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}