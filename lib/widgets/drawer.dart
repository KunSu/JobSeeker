import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/auth_bloc.dart';
import 'package:jobseeker/routes/routes.gr.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((user) {
      if (user == null) {
        ExtendedNavigator.of(context).replace(
          Routes.loginScreen,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    // TODO: implement the rest of drawer
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Text(
              'JobSeeker',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Job Board'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),
          const Divider(
            thickness: 2,
            indent: 70,
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
          const ListTile(
            leading: Icon(Icons.bug_report),
            title: Text('Send feedback'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: authBloc.signOut,
          ),
        ],
      ),
    );
  }
}
