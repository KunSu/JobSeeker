import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/boards_provider.dart';
import 'package:jobseeker/models/jobboard.dart';

import 'package:jobseeker/modules/jobboard/jobboard.dart';
import 'package:jobseeker/widgets/widgets.dart';
import 'package:provider/provider.dart';

class JobBoardScreen extends StatelessWidget {
  JobBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardsProvider = Provider.of<BoardsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Boards'),
      ),
      body: StreamBuilder<List<JobBoard>>(
        stream: boardsProvider.boards,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return JobBoardListCardView(board: snapshot.data[index]);
            },
          );
        },
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
