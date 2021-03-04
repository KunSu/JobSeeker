import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/auth_bloc.dart';
import 'package:jobseeker/modules/login/login.dart';
import 'package:jobseeker/widgets/dialogs/dialogs.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<LoginScreen>(
            builder: (context) => LoginScreen(),
          ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();

              print(snapshot.data);
              // print(snapshot.data.);
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
      ),
    );
  }
}
