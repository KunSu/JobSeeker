import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

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
            title: Text('Job Boards'),
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
