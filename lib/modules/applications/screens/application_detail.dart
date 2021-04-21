import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:jobseeker/blocs/blocs.dart';
import 'package:jobseeker/models/models.dart';
import 'package:jobseeker/service/application_repository.dart';

class ApplicationDetailPage extends StatefulWidget {
  ApplicationDetailPage({
    Key key,
    this.application,
    @required this.boardId,
  }) : super(key: key);

  final String boardId;
  final Application application;
  @override
  _ApplicationDetailPageState createState() => _ApplicationDetailPageState();
}

class _ApplicationDetailPageState extends State<ApplicationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.application == null
            ? 'Create an application'
            : 'Update an application'),
      ),
      body: BlocProvider(
        create: (context) => ApplicationBloc(
          applicationRepository: ApplicationRepository(),
          application: widget.application,
        ),
        child: ApplicationForm(
          boardId: widget.boardId,
        ),
      ),
    );
  }
}

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({
    Key key,
    @required this.boardId,
  }) : super(key: key);

  final String boardId;

  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  ApplicationBloc formBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formBloc = BlocProvider.of<ApplicationBloc>(context)
      ..boardId = widget.boardId;
  }

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<ApplicationBloc, String, String>(
      onSuccess: (context, state) {
        ExtendedNavigator.of(context).pop();
      },
      onFailure: (context, state) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(state.failureResponse),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // TODO: add Icon
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.companyaName,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Company',
                  // prefixIcon: Icon(
                  //   Icons.business,
                  // ),
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.jobTitle,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  // prefixIcon: Icon(
                  //   Icons.description,
                  // ),
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.location,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  // prefixIcon: Icon(
                  //   Icons.description,
                  // ),
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.url,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: 'URL',
                  // prefixIcon: Icon(
                  //   Icons.description,
                  // ),
                ),
              ),
              DropdownFieldBlocBuilder(
                selectFieldBloc: formBloc.status,
                itemBuilder: (context, value) => value,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  // prefixIcon: Icon(
                  //   Icons.assignment,
                  // ),
                ),
              ),
              TextFieldBlocBuilder(
                // TODO: Max maxLines
                maxLines: 10,
                textFieldBloc: formBloc.description,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  // TODO: Fix lableText
                  // labelText: 'Description',
                  // labelStyle: TextStyle(inherit: true),
                  hintText: 'Description',
                  // prefixIcon: Icon(
                  //   Icons.description,
                  // ),
                ),
                // expands: true,
              ),
              RaisedButton(
                onPressed: formBloc.submit,
                color: Colors.blue,
                textColor: Colors.white,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
