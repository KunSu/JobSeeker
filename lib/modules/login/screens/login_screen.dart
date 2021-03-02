import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/modules/home/home.dart';
import 'package:jobseeker/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(
                Icons.email,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: const Text('Sign in'),
              onPressed: () async {
                await _signInUser(
                  context: context,
                  email: _email,
                  password: _password,
                );
              },
            ),
            RaisedButton(
              child: const Text('Sign up'),
              onPressed: () async {
                await _signUpUser(
                  context: context,
                  email: _email,
                  password: _password,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

Future<void> _signUpUser({
  @required BuildContext context,
  @required String email,
  @required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      displayError(
        context: context,
        error: 'The password provided is too weak.',
      );
    } else if (e.code == 'email-already-in-use') {
      displayError(
        context: context,
        error: 'The account already exists for that email.',
      );
    }
  }
}

Future<void> _signInUser({
  @required BuildContext context,
  @required String email,
  @required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      displayError(
        context: context,
        error: 'No user found for that email.',
      );
    } else if (e.code == 'wrong-password') {
      displayError(
        context: context,
        error: 'Wrong password provided for that user.',
      );
    }
  }
}
