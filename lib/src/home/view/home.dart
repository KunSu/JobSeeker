import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/src/components/view/view.dart';
import 'package:jobseeker/src/login/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Author Info'),
              onPressed: () async {
                authorInfoDialog(
                  context: context,
                  title: 'Info',
                  text: 'Author: Kun Su',
                );
              },
            ),
            RaisedButton(
              child: Text('Logout'),
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
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
