import 'package:flutter/material.dart';

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
    // final currentRoute = ModalRoute.of(context).settings.name;
    // switch (currentRoute) {
    //   case '/account':
    //     _selectedIndex = 1;
    //     break;
    //   case '/item':
    //     _selectedIndex = 2;
    //     break;
    //   default:
    //     _selectedIndex = 0;
    //     break;
    // }
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Job Board',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
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
      // if (_selectedIndex == 0) {
      //   if (ModalRoute.of(context).settings.name != _homeRouteName) {
      //     Navigator.pushReplacementNamed(context, _homeRouteName);
      //   }
      // } else if (_selectedIndex == 1) {
      //   Navigator.pushReplacementNamed(context, AccountPage.routeName);
      // } else if (_selectedIndex == 2) {
      //   Navigator.pushReplacementNamed(context, ItemPage.routeName);
      // }
    });
  }
}
