import 'package:flutter/material.dart';
import 'package:jobseeker/modules/home/home.dart';
import 'package:jobseeker/widgets/jobboard/jobboard_navigationbar.dart';
import 'package:jobseeker/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              // TODO: Add icon?
              Tab(
                // icon: Icon(Icons.text_fields),
                text: 'Wishlist',
              ),
              Text('Applied'),
              Text('Interview'),
              Text('Offer'),
              Text('Rejected'),
            ],
          ),
        ),
        drawer: const HomeDrawer(),
        body: const TabBarView(
          // TODO: implement JobListView
          children: [
            JobListView(),
            JobListView(),
            JobListView(),
            JobListView(),
            JobListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
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
