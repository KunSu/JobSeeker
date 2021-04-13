import 'package:flutter/material.dart';
import 'package:jobseeker/modules/map/map.dart';
import 'package:jobseeker/widgets/widgets.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Map'),
              Tab(text: 'List'),
            ],
          ),
        ),
        body: ApplicationFloatinigSearchPage(),
        bottomNavigationBar: JobBoardBottomNavigationBar(),
      ),
    );
  }
}
