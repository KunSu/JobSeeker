import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/auth_bloc.dart';
import 'package:jobseeker/routes/routes.gr.dart';
import 'package:jobseeker/widgets/widgets.dart';
import 'package:provider/provider.dart';

class JobListView extends StatefulWidget {
  const JobListView({
    Key key,
  }) : super(key: key);

  @override
  _JobListViewState createState() => _JobListViewState();
}

class _JobListViewState extends State<JobListView> {
  // TODO: Delete Subscription and log out buttom after demo
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
    return Center(
      child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          builder: (context, snapshot) {
            // TODO: Error handle
            if (!snapshot.hasData) return const CircularProgressIndicator();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: snapshot.data.displayName != null,
                  child: Text(
                    snapshot.data.displayName != null
                        ? snapshot.data.displayName
                        : '',
                    style: const TextStyle(fontSize: 35.0),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Visibility(
                  visible: snapshot.data.photoURL != null,
                  child: CircleAvatar(
                    // add .replaceFirst('s96', 's400') at the end of
                    // snapshot.data.photoURL for better image.
                    backgroundImage: NetworkImage(
                      snapshot.data.photoURL != null
                          ? snapshot.data.photoURL
                          : '',
                    ),
                    radius: 45.0,
                  ),
                ),
                Text(
                  snapshot.data.uid,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                RaisedButton(
                  child: const Text('Author Info'),
                  onPressed: () async {
                    await authorInfoDialog(
                      context: context,
                      title: 'Info',
                      text: 'Author: Kun Su',
                    );
                  },
                ),
                RaisedButton(
                  child: const Text('Logout'),
                  onPressed: authBloc.signOut,
                )
              ],
            );
          }),
    );
  }
}
