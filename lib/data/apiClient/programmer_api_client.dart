import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/data/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProgrammerApiClient {
  FirebaseFirestore firebaseFirestore ;
  FirebaseAuth firebaseAuth ;
  FirebaseStorage firebaseStorage ;

  ProgrammerApiClient(
      this.firebaseFirestore, this.firebaseAuth, this.firebaseStorage);

  Future<List<OrganizerEvents>> getAllConferences() async {
    var conferences = <OrganizerEvents>[];
    var snapshot = await firebaseFirestore.collection('Users').get();
    for (var doc in snapshot.docs) {
      var resConf = await firebaseFirestore.collection('Users').doc(doc.id).collection('Conferences')
          .orderBy('created',descending: true)
          .get() ;
      for(var conf in resConf.docs) {
        var conference = OrganizerEvents.fromJson(conf.data());
        conference.uid = conf.id;
        conference.user = UserModel.fromJson(doc.data());
        conference.user?.uId = doc.id;
        conferences.add(conference);
      }
    }
    print(conferences.length) ;

    // order the conferences by date
    conferences.sort((a, b) => a.created!.compareTo(b.created!));
    conferences = conferences.reversed.toList();
    return conferences;
  }
  Future<void> updateConference(OrganizerEvents organizerEvents)async{
    if(organizerEvents.code != null){
        if(await firebaseFirestore.collection('Conferences code').doc(organizerEvents.code).get().then((value) => value.exists)){
          throw Exception('Conference code already exists');
        }
        await firebaseFirestore.collection('Conferences code').doc(organizerEvents.code).set(
          {
            'path' : firebaseFirestore.collection('Users').doc(organizerEvents.user?.uId)
                .collection('Conferences').doc(organizerEvents.uid)
          }
        );
    }
    await firebaseFirestore.collection('Users').doc(organizerEvents.user?.uId)
        .collection('Conferences').doc(organizerEvents.uid).set(organizerEvents.toJson());
  }


}