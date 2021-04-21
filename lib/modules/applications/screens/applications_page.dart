import 'package:flutter/material.dart';
import 'package:jobseeker/modules/applications/applications.dart';

class ApplicationsPage extends StatefulWidget {
  ApplicationsPage({Key key, @required this.boardId}) : super(key: key);
  final String boardId;

  @override
  _ApplicationsPageState createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Applications'),
      ),
      body: ApplicationsListView(
        boardId: widget.boardId,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Change navigator
          Navigator.push(
            context,
            MaterialPageRoute<ApplicationDetailPage>(
              builder: (coontext) => ApplicationDetailPage(
                application: null,
                boardId: widget.boardId,
              ),
            ),
          );
        },
        label: const Text('Application'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
