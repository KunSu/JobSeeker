import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/modules/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as env;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await env.load(fileName: '.env');
  runApp(const App());
}
