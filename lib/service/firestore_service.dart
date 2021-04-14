import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/models/jobboard.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get
  Stream<List<JobBoard>> getJobBoards({@required String uid}) {
    // TODO: get documents by id
    return _db.collection('boards').snapshots().map((snapshot) =>
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
