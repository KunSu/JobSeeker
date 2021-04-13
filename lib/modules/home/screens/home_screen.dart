import 'package:flutter/material.dart';

import 'package:jobseeker/widgets/jobboard/jobboard.dart';
import 'package:jobseeker/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

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
                // icon: Icon(Icons.text_fields),
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
        body: const TabBarView(
          // TODO: implement JobListView
          children: [
            JobListView(),
            JobListView(),
            JobListView(),
            JobListView(),
            JobListView(),
            JobListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // TODO: Add your onPressed code here!
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
