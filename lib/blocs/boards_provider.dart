import 'package:flutter/material.dart';
import 'package:jobseeker/models/jobboard.dart';
import 'package:jobseeker/service/firestore_service.dart';
import 'package:uuid/uuid.dart';

// TODO: upgrade Provoder to BLOC
class BoardsProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _id;
  String _name;
  String _createdDate;
  var uuid = Uuid();

  // Getters
  String get name => _name;
  String get createdDate => _createdDate;
  Stream<List<JobBoard>> get boards => firestoreService.getJobBoards();

  // Setters
  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  void loadAll(JobBoard jobBoard) {
    if (jobBoard != null) {
      _id = jobBoard.id;
      _name = jobBoard.name;
      _createdDate = jobBoard.createdDate;
    } else {
      _id = null;
      _name = null;
      _createdDate = DateTime.now().toIso8601String();
    }
  }

  void saveJobBoard() {
    if (_id == null) {
      // Add
      final newJobBoard =
          JobBoard(id: uuid.v1(), name: _name, createdDate: _createdDate);
      firestoreService.updateJobBoard(newJobBoard);
    } else {
      // Update
      final updatedJobBoard =
          JobBoard(id: _id, name: _name, createdDate: _createdDate);
      firestoreService.updateJobBoard(updatedJobBoard);
    }
  }

  void removeJobBoard(String id) {
    firestoreService.removeBoard(id);
  }
}
