import 'package:get_it/get_it.dart';

import 'FirebaseData.dart';
import 'CRUDModel.dart';

//sachin kumara Liyanage
//IT17152938
//test comment
GetIt locator = GetIt.instance;

final String firebaseImageUrl = 'gs://mediscope-cfcfc.appspot.com';
final String firebaseImageMainFolder = 'images/';

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDataApi('Medicine'));
  locator.registerLazySingleton(() => CRUDModel());
}
