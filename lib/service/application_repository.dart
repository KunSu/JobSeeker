import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/models/models.dart';

class ApplicationRepository {
  final _auth = FirebaseAuth.instance;
  final _applicationCollection =
      FirebaseFirestore.instance.collection('applications');
  User _user;

  // Get
  Stream<List<Application>> applications({@required String boardID}) {
    _user = _auth.currentUser;
    return _applicationCollection
        .where('uid', isEqualTo: _user.uid)
        .where('board_id', isEqualTo: boardID)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Application.fromJson(doc.data()))
            .toList()
              ..sort((a, b) => b.createdDate
                  .compareTo(a.createdDate))); // Sort created date descending
  }

  // Delete
  Future<void> deleteApplication(String id) {
    return _applicationCollection.doc(id).delete();
  }

  // Create and Update
  Future<void> updateApplication(Application application) {
    var options = SetOptions(merge: true);

    return _applicationCollection
        .doc(application.id)
        .set(application.toJson(), options);
  }
}
