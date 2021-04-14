import 'package:flutter/material.dart';
import 'package:jobseeker/models/jobboard.dart';
import 'package:jobseeker/service/firestore_service.dart';
import 'package:uuid/uuid.dart';

// TODO: upgrade Provoder to BLOC
class BoardsProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _id;
  String _uid;
  String _name;
  String _createdDate;
  var uuid = Uuid();

  // Getters
  String get name => _name;
  String get createdDate => _createdDate;
  Stream<List<JobBoard>> get boards => firestoreService.getJobBoards(uid: _uid);

  // Setters
  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  set setUID(String email) {
    _uid = uuid.v5(Uuid.NAMESPACE_URL, email);
  }

  void loadAll(JobBoard jobBoard) {
    if (jobBoard != null) {
      _id = jobBoard.id;
      _uid = jobBoard.uid;
      _name = jobBoard.name;
      _createdDate = jobBoard.createdDate;
    } else {
      _id = null;
      _uid = null;
      _name = null;
      _createdDate = DateTime.now().toIso8601String();
    }
  }

  void saveJobBoard() {
    if (_id == null) {
      // Add
      final newJobBoard = JobBoard(
          id: uuid.v1(), uid: _uid, name: _name, createdDate: _createdDate);
      firestoreService.updateJobBoard(newJobBoard);
    } else {
      // Update
      final updatedJobBoard =
          JobBoard(id: _id, uid: _uid, name: _name, createdDate: _createdDate);
      firestoreService.updateJobBoard(updatedJobBoard);
    }
  }

  void removeJobBoard(String id) {
    firestoreService.removeBoard(id);
  }
}
