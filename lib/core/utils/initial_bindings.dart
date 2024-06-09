import 'package:cece/core/app_export.dart';
import 'package:cece/data/apiClient/api_client.dart';
import 'package:cece/data/apiClient/programmer_api_client.dart';
import 'package:cece/data/remote_data_source/programmer_remote_data_source.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../presentation/organizer/profile/controller/profile_controller.dart';

/// A class for setting up initial dependencies using GetX dependency injection.
///
/// This class extends the [Bindings] class and overrides the [dependencies]
/// method to register dependencies using GetX's [Get.put] method.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Get.put(firebaseFirestore);
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Get.put(firebaseAuth) ;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Get.put(firebaseStorage);
    Get.put(ApiClient(Get.find(),Get.find(),Get.find(),));
    Get.put(ProgrammerApiClient(Get.find(),Get.find(),Get.find(),));
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(UserRemoteDataSource(Get.find(),Get.find()));
    Get.put(ProgrammerRemoteDataSource(Get.find(),Get.find()));
  }
}
