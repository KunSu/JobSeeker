import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/modules/login/login.dart';
import 'package:jobseeker/widgets/dialogs/dialogs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onPressed: () async {
                await _signOut(context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _signOut({@required BuildContext context}) async {
  final auth = FirebaseAuth.instance;
  await auth.signOut();
  await Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
