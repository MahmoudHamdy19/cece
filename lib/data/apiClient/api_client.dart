import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/data/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ApiClient extends GetConnect {
  FirebaseFirestore firebaseFirestore ;
  FirebaseAuth firebaseAuth ;
  FirebaseStorage firebaseStorage ;
  ApiClient(this.firebaseFirestore, this.firebaseAuth, this.firebaseStorage);

   Future<String> login(String email, String password) async{
     await firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
     return await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid).get().then((value) => value.data()!['userType']);
   }

   Future<void> forgetPassword(String email) async{
     if((await firebaseFirestore.collection('Users').where('email',isEqualTo: email).get()).docs.length>0) {
       await firebaseAuth.sendPasswordResetEmail(email: email.trim());
     }else {
       throw Exception('Email not found');
     }
   }

  Future<void> register(UserModel userModel,String password) async{
     var response = await firebaseAuth.createUserWithEmailAndPassword(email: userModel.email!.trim(), password: password.trim());
     userModel.uId = response.user?.uid;
       await firebaseFirestore.collection('Users').doc(response.user?.uid).set(userModel.toMap());
    }

    Future<UserModel> getProfile()async{
     var response = await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid).get();
     return UserModel.fromJson(response.data()!);
    }
  Future<void> updateProfile(UserModel user)async{

     await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid).update(user.toMap());
   }
    Future<void> addConference(OrganizerEvents organizerEvents)async{
     if(organizerEvents.conferenceDetails?.imageFile!=null){
       String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
       Reference firebaseStorageRef =
       FirebaseStorage.instance.ref().child('images/$fileName');
       UploadTask uploadTask = firebaseStorageRef.putData(organizerEvents.conferenceDetails!.imageFile!);
       TaskSnapshot taskSnapshot = await uploadTask;
       print(taskSnapshot.ref);
       organizerEvents.conferenceDetails?.image  = await taskSnapshot.ref.getDownloadURL();
     }
     if(organizerEvents.conferenceDetails?.backgroundImageFile!=null){
       String fileName = 'background_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
       Reference firebaseStorageRef =
       FirebaseStorage.instance.ref().child('images/$fileName');
       UploadTask uploadTask = firebaseStorageRef.putData(organizerEvents.conferenceDetails!.backgroundImageFile!);
       TaskSnapshot taskSnapshot = await uploadTask;
       print(taskSnapshot.ref);
       organizerEvents.conferenceDetails?.backgroundImage  = await taskSnapshot.ref.getDownloadURL();
     }
     var conf = await getConferences();
     // check if the conference name already exists

     if(conf.any((element) => element.conferenceDetails?.conferenceName == organizerEvents.conferenceDetails?.conferenceName)){
       throw FirebaseException(message: 'Conference name already exists',code: '1001',plugin: 'FirebaseFirestore',);
     }else {
       await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid)
           .collection('Conferences').add(organizerEvents.toJson());
     }

    }

  Future<void> updateConference(OrganizerEvents organizerEvents)async{
    if(organizerEvents.conferenceDetails?.imageFile!=null){
      String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putData(organizerEvents.conferenceDetails!.imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask;
      print(taskSnapshot.ref);
      organizerEvents.conferenceDetails?.image  = await taskSnapshot.ref.getDownloadURL();
    }
    if(organizerEvents.conferenceDetails?.backgroundImageFile!=null){
      String fileName = 'background_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putData(organizerEvents.conferenceDetails!.backgroundImageFile!);
      TaskSnapshot taskSnapshot = await uploadTask;
      print(taskSnapshot.ref);
      organizerEvents.conferenceDetails?.backgroundImage  = await taskSnapshot.ref.getDownloadURL();
    }
    await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid)
        .collection('Conferences').doc(organizerEvents.uid).set(organizerEvents.toJson());
  }

  Future<void> deleteConferences(organizerEventsId)async{
     await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid)
         .collection('Conferences').doc(organizerEventsId).delete();
  }

  Future<List<OrganizerEvents>> getConferences()async{
     var response =  await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid)
         .collection('Conferences')
    .orderBy('created',descending: true)
         .get();
     var conf =  response.docs.map((e) {
       var orgs = OrganizerEvents.fromJson(e.data());
       orgs.uid = e.id;
       return orgs;
     }).toList();
     return conf;
    }


}
