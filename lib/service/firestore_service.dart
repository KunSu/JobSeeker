import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/models/jobboard.dart';

class FirestoreService {
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User _user;

  // Get
  Stream<List<JobBoard>> getJobBoards({@required String uid}) {
    _user = auth.currentUser;
    // TODO: get documents by id
    return _db
        .collection('boards')
        .where('uid', isEqualTo: _user.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => JobBoard.fromJson(doc.data())).toList()
              ..sort((a, b) => b.createdDate
                  .compareTo(a.createdDate))); // Sort created date descending
  }

  // Create and Update
  Future<void> updateJobBoard(JobBoard newBoard) {
    var options = SetOptions(merge: true);
    return _db
        .collection('boards')
        .doc(newBoard.id)
        .set(newBoard.toJson(), options);
  }

  // Delete
  Future<void> removeBoard(String id) {
    return _db.collection('boards').doc(id).delete();
  }
}
