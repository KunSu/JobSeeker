import 'package:flutter/material.dart';
import 'package:jobseeker/models/jobboard.dart';
import 'package:jobseeker/modules/home/home.dart';
import 'package:jobseeker/modules/jobboard/jobboard.dart';

class JobBoardListCardView extends StatefulWidget {
  JobBoardListCardView({
    Key key,
    @required this.board,
  }) : super(key: key);

  final JobBoard board;

  @override
  JobBoardListCardViewState createState() => JobBoardListCardViewState();
}

class JobBoardListCardViewState extends State<JobBoardListCardView> {
  @override
  Widget build(BuildContext context) {
    // TODO: This can be simplified
    final _createdDaysAgo = DateTime.now()
        .difference(DateTime.parse(widget.board.createdDate))
        .inDays;
    final _createdMinsAgo = DateTime.now()
        .difference(DateTime.parse(widget.board.createdDate))
        .inMinutes;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        // This ensures that the Card's children are clipped correctly.
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(widget.board.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // TODO: extract common values
                        const JobBoardGrid(number: '110', status: 'Applied'),
                        const JobBoardGrid(number: '5', status: 'Rejected'),
                        const JobBoardGrid(number: '20', status: 'Interview'),
                        const JobBoardGrid(number: '3', status: 'Offer'),
                      ],
                    ),
                    (_createdDaysAgo >= 1)
                        ? Text('Created $_createdDaysAgo days ago')
                        : Text('Created $_createdMinsAgo minutes ago'),
                  ],
                ),
                trailing: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<CreateJobBoard>(
                            builder: (context) =>
                                CreateJobBoard(jobBoard: widget.board)));
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<HomeScreen>(
                          builder: (coontext) => const HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobBoardGrid extends StatelessWidget {
  const JobBoardGrid({
    Key key,
    this.number,
    this.status,
  }) : super(key: key);

  final String number;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO: Overflowing Issue
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}
