import 'package:flutter/material.dart';
import 'package:jobseeker/blocs/auth_bloc.dart';
import 'package:jobseeker/blocs/boards_provider.dart';
import 'package:jobseeker/modules/login/login.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Upgrade to BLOC
    return Provider(
      create: (context) => AuthBloc(),
      child: ChangeNotifierProvider(
        create: (context) => BoardsProvider(),
        child: MaterialApp(
          title: 'Login App',
          theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
