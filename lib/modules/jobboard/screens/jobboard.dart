import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/boards_provider.dart';
import 'package:jobseeker/models/jobboard.dart';
import 'package:jobseeker/modules/jobboard/jobboard.dart';
import 'package:jobseeker/widgets/widgets.dart';
import 'package:provider/provider.dart';

class JobBoardScreen extends StatefulWidget {
  JobBoardScreen();

  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  BoardsProvider boardsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    boardsProvider = Provider.of<BoardsProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Boards'),
      ),
      body: StreamBuilder<List<JobBoard>>(
        stream: boardsProvider.boards,
        builder:
            (BuildContext context, AsyncSnapshot<List<JobBoard>> snapshot) {
          if (snapshot.hasError) {
            // TODO: Better error handle
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return JobBoardListCardView(board: snapshot.data[index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      endDrawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Change navigator
          Navigator.push(
            context,
            MaterialPageRoute<CreateJobBoard>(
              builder: (coontext) => CreateJobBoard(
                jobBoard: null,
              ),
            ),
          );
        },
        label: const Text('Job Board'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
