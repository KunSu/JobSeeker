import 'package:flutter/material.dart';
import 'package:jobseeker/modules/jobboard/add_board.dart';
import 'package:jobseeker/modules/jobboard/jobboard.dart';
import 'package:jobseeker/widgets/widgets.dart';

class JobBoardScreen extends StatelessWidget {
  JobBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Boards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            JobBoardListCardView(),
          ],
        ),
      ),
      endDrawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute<CreateJobBoard>(
                  builder: (coontext) => CreateJobBoard()));
        },
        label: const Text('Job Board'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}