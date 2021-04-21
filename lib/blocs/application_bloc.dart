import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:jobseeker/models/models.dart';
import 'package:jobseeker/service/application_repository.dart';
import 'package:uuid/uuid.dart';

class ApplicationBloc extends FormBloc<String, String> {
  ApplicationBloc({
    @required this.applicationRepository,
    @required this.application,
  }) : super(isLoading: true) {
    addFieldBlocs(
      fieldBlocs: [
        companyaName,
        jobTitle,
        location,
        url,
        status,
        description,
      ],
    );
  }

  final auth = FirebaseAuth.instance;
  final ApplicationRepository applicationRepository;
  final Application application;

  final companyaName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final jobTitle = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final location = TextFieldBloc();

  final url = TextFieldBloc();

  final status = SelectFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
    items: ['Wishlist', 'Applied', 'Interview', 'Offer', 'Rejected'],
  );

  final description = TextFieldBloc();

  DateTime _createdDate;
  String _boardID;
  String _id;

  set boardId(String boardId) {
    _boardID = boardId;
  }

  @override
  Future<void> onLoading() async {
    super.onLoading();

    if (application != null) {
      companyaName.updateInitialValue(application.companyaName);
      _createdDate = application.createdDate;
      description.updateInitialValue(application.description);
      _id = application.id;
      location.updateInitialValue(application.location);
      jobTitle.updateInitialValue(application.jobTitle);
      status.updateInitialValue(application.status);
      url.updateInitialValue(application.url);
    }

    emitLoaded();
  }

  @override
  void onSubmitting() async {
    final application = Application(
      boardID: _boardID,
      companyaName: companyaName.value,
      createdDate: _createdDate ?? DateTime.now(),
      description: description.value,
      id: _id ?? Uuid().v1(),
      location: location.value,
      jobTitle: jobTitle.value,
      status: status.value,
      uid: auth.currentUser.uid,
      updatedDate: DateTime.now(),
      url: url.value,
    );

    try {
      await applicationRepository.updateApplication(application);
      emitSuccess(
        canSubmitAgain: true,
      );
    } catch (e) {
      emitFailure(failureResponse: e.toString());
    }
  }
}
