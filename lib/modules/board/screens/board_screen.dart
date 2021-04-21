import 'package:flutter/material.dart';
import 'package:jobseeker/modules/applications/applications.dart';

import 'package:jobseeker/widgets/jobboard/jobboard.dart';
import 'package:jobseeker/widgets/widgets.dart';

class BoardScreen extends StatelessWidget {
  BoardScreen({@required this.boardId});
  final String boardId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              // TODO: Add icon?
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Wishlist',
              ),
              Tab(
                text: 'Applied',
              ),
              Tab(
                text: 'Interview',
              ),
              Tab(
                text: 'Offer',
              ),
              Tab(
                text: 'Rejected',
              ),
            ],
          ),
        ),
        endDrawer: const HomeDrawer(),
        body: TabBarView(
          children: [
            ApplicationsListView(
              boardId: boardId,
              status: 'All',
            ),
            ApplicationsListView(
              boardId: boardId,
              status: 'Wishlist',
            ),
            ApplicationsListView(
              boardId: boardId,
              status: 'Applied',
            ),
            ApplicationsListView(
              boardId: boardId,
              status: 'Interview',
            ),
            ApplicationsListView(
              boardId: boardId,
              status: 'Offer',
            ),
            ApplicationsListView(
              boardId: boardId,
              status: 'Rejected',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<ApplicationDetailPage>(
                builder: (coontext) => ApplicationDetailPage(
                  application: null,
                  boardId: boardId,
                ),
              ),
            );
          },
          label: const Text('Application'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: JobBoardBottomNavigationBar(),
      ),
    );
  }
}
