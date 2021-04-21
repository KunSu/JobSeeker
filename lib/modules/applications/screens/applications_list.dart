import 'package:flutter/material.dart';
import 'package:jobseeker/models/models.dart';
import 'package:intl/intl.dart';
import 'package:jobseeker/modules/applications/applications.dart';
import 'package:jobseeker/service/application_repository.dart';

class ApplicationsListView extends StatefulWidget {
  ApplicationsListView({Key key, @required this.boardId}) : super(key: key);
  final String boardId;

  @override
  _ApplicationsListViewState createState() => _ApplicationsListViewState();
}

class _ApplicationsListViewState extends State<ApplicationsListView> {
  final ApplicationRepository _applicationRepository = ApplicationRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Application>>(
        stream: _applicationRepository.applications(boardID: widget.boardId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // TODO: Better error handle
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _ApplicationListTile(
                    data: snapshot.data[index], widget: widget);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class _ApplicationListTile extends StatelessWidget {
  const _ApplicationListTile({
    Key key,
    @required this.data,
    @required this.widget,
  }) : super(key: key);

  final Application data;
  final ApplicationsListView widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // TODO: Add company logo
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(
      //     '',
      //   ),
      //   radius: 25.0,
      // ),
      title: Text(data.companyaName),
      subtitle: Text(data.jobTitle),
      trailing:
          // TODO: Local timezone problem?
          Text('Applied on ${DateFormat.yMMMMd().format(data.createdDate)}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<ApplicationDetailPage>(
            builder: (coontext) => ApplicationDetailPage(
              application: data,
              boardId: widget.boardId,
            ),
          ),
        );
      },
    );
  }
}
