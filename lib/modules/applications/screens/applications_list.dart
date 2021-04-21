import 'package:flutter/material.dart';
import 'package:jobseeker/models/models.dart';
import 'package:intl/intl.dart';
import 'package:jobseeker/modules/applications/applications.dart';
import 'package:jobseeker/service/application_repository.dart';

class ApplicationsListView extends StatefulWidget {
  ApplicationsListView({
    Key key,
    @required this.boardId,
    @required this.status,
  }) : super(key: key);
  final String boardId;
  final String status;
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
            var data = snapshot.data;
            // Filter data by status
            if (widget.status != 'All') {
              data = snapshot.data
                  .where((application) => (application.status == widget.status))
                  .toList();
            }

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _ApplicationListTile(
                    data: data[index], boardId: widget.boardId);
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
    @required this.boardId,
  }) : super(key: key);

  final Application data;
  final String boardId;

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
              boardId: boardId,
            ),
          ),
        );
      },
    );
  }
}
