import 'package:auto_route/auto_route_annotations.dart';
import 'package:jobseeker/modules/home/home.dart';
import 'package:jobseeker/modules/jobboard/screens/screens.dart';
import 'package:jobseeker/modules/login/login.dart';
import 'package:jobseeker/modules/reset/reset.dart';
import 'package:jobseeker/modules/verify/screens/verify_screen.dart';

/// Run 'flutter packages pub run build_runner watch --delete-conflicting-outputs'
/// to gerenate routing files.
@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute<LoginScreen>(page: LoginScreen, initial: true),
    MaterialRoute<HomeScreen>(page: HomeScreen, path: 'homoe'),
    MaterialRoute<JobBoardScreen>(page: JobBoardScreen, path: '/jobboard'),
    MaterialRoute<ResetScreen>(page: ResetScreen, path: '/reset'),
    MaterialRoute<VerifyScreen>(page: VerifyScreen, path: '/verify'),
  ],
)
class $Router {}
