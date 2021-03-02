import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/src/components/view/view.dart';
import 'package:jobseeker/src/home/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              child: Text('Sign in'),
              onPressed: () async {
                await _signInUser(
                  context: context,
                  email: _email,
                  password: _password,
                );
              },
            ),
            RaisedButton(
              child: Text('Sign up'),
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
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
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
    return;
  }
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
}

Future<void> _signInUser({
  @required BuildContext context,
  @required String email,
  @required String password,
}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
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
    return;
  }
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
}