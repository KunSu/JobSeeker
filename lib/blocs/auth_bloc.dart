import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobseeker/service/auth_service.dart';
import 'package:jobseeker/widgets/widgets.dart';
import 'package:jobseeker/routes/routes.gr.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);

  Stream<User> get currentUser => authService.currentUser;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    // ignore: omit_local_variable_types
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    // ignore: omit_local_variable_types
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    // ignore: omit_local_variable_types
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await authService.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await authService.logout();
  }

  Future<void> signUpUser({
    @required BuildContext context,
    @required String email,
    @required String password,
  }) async {
    try {
      await authService
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((_) {
        ExtendedNavigator.of(context).replace(
          Routes.verifyScreen,
        );
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

  Future<void> signInUser({
    @required BuildContext context,
    @required String email,
    @required String password,
  }) async {
    try {
      await authService
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((_) {
        ExtendedNavigator.of(context).replace(
          Routes.jobBoardScreen,
        );
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
}
