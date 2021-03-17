import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  ResetScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset password'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email;

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
              // TODO: Check if email exists in the database
              setState(() {
                _email = value.trim();
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: const Text('Reset Password'),
              onPressed: () {
                _resetPassword(
                  context: context,
                  email: _email,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

void _resetPassword({
  @required BuildContext context,
  @required String email,
}) {
  FirebaseAuth.instance..sendPasswordResetEmail(email: email);
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('An email has been sent to $email'),
  ));
  Timer(const Duration(seconds: 2), () {
    ExtendedNavigator.of(context).pop();
  });
}
