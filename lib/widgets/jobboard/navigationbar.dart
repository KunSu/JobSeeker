import 'package:flutter/material.dart';
import 'package:jobseeker/routes/routes.gr.dart';

class JobBoardBottomNavigationBar extends StatefulWidget {
  JobBoardBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _JobBoardBottomNavigationBarState createState() =>
      _JobBoardBottomNavigationBarState();
}

class _JobBoardBottomNavigationBarState
    extends State<JobBoardBottomNavigationBar> {
  _JobBoardBottomNavigationBarState();

  int _selectedIndex = 0;

  // TODO: Clear up
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;
    switch (currentRoute) {
      case '${Routes.boardScreen}':
        _selectedIndex = 0;
        break;
      // case '${Routes.mapScreen}':
      //   _selectedIndex = 1;
      //   break;
      default:
        _selectedIndex = 0;
        break;
    }
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Job Board',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'TDB',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    // var _homeRouteName;
    // switch (identity) {
    //   case 'donor':
    //     _homeRouteName = DonorPage.routeName;
    //     break;
    //   case 'employee':
    //     _homeRouteName = EmployeePage.routeName;
    //     break;
    //   case 'recipient':
    //     _homeRouteName = RecipientPage.routeName;
    //     break;
    //   case 'admin':
    //     _homeRouteName = AdminPage.routeName;
    //     break;
    //   default:
    //     break;
    // }
    setState(() {
      _selectedIndex = index;
      final _screenName = ModalRoute.of(context).settings.name;
      if (_selectedIndex == 0) {
        if (_screenName != Routes.boardScreen) {
          Navigator.pushReplacementNamed(context, Routes.boardScreen);
        }
      } else if (_selectedIndex == 1) {
        // if (_screenName != Routes.mapScreen) {
        //   Navigator.pushReplacementNamed(context, Routes.mapScreen);
        // }
      }
      // else if (_selectedIndex == 2) {
      //   Navigator.pushReplacementNamed(context, ItemPage.routeName);
      // }
    });
  }
}
