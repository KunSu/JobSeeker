import 'package:flutter/material.dart';
import 'package:jobseeker/modules/home/home.dart';

class JobBoardListCardView extends StatefulWidget {
  JobBoardListCardView({Key key}) : super(key: key);

  final String name = 'Fall 2021 Job Search';
  final String companyName = 'Google';
  final String location = 'San Jose';
  @override
  JobBoardListCardViewState createState() => JobBoardListCardViewState();
}

class JobBoardListCardViewState extends State<JobBoardListCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // This ensures that the Card's children are clipped correctly.
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Generally, material cards use onSurface with 12% opacity for the pressed state.
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        // Generally, material cards do not have a highlight overlay.
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(widget.name),
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
                    const Text('Created 5 days ago'),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<HomeScreen>(
                  builder: (coontext) => const HomeScreen()));
        },
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
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 24.0, 16.0),
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
