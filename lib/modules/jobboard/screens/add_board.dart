import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/boards_provider.dart';
import 'package:jobseeker/models/jobboard.dart';
import 'package:provider/provider.dart';

// TODO: Hero widget?
class CreateJobBoard extends StatefulWidget {
  CreateJobBoard({
    Key key,
    @required this.jobBoard,
  }) : super(key: key);

  final JobBoard jobBoard;
  @override
  _CreateJobBoardState createState() => _CreateJobBoardState();
}

class _CreateJobBoardState extends State<CreateJobBoard> {
  final boardController = TextEditingController();
  BoardsProvider boardsProvider;

  @override
  void initState() {
    super.initState();
    boardsProvider = Provider.of<BoardsProvider>(context, listen: false);
    if (widget.jobBoard != null) {
      // Update
      boardsProvider.loadAll(widget.jobBoard);
    } else {
      // Add
      boardsProvider.loadAll(null);
    }
  }

  @override
  void dispose() {
    boardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Fix title
        title: (widget.jobBoard == null)
            ? const Text('Add a Board')
            : const Text('Update board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (String value) => boardsProvider.changeName = value,
              controller: boardController,
              decoration: InputDecoration(
                  labelText: 'Board name',
                  hintText: (widget.jobBoard == null)
                      ? 'Board name'
                      : widget.jobBoard.name,
                  prefixIcon: const Icon(Icons.edit)),
            ),
            // TODO: Need a better buttom UI
            Center(
              child: RaisedButton(
                child: const Text(
                  'Save',
                ),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  boardsProvider.saveJobBoard();
                  ExtendedNavigator.of(context).pop();
                },
              ),
            ),
            (widget.jobBoard != null)
                ? Center(
                    child: RaisedButton(
                      child: const Text(
                        'Delete',
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        boardsProvider.removeJobBoard(widget.jobBoard.id);
                        ExtendedNavigator.of(context).pop();
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
