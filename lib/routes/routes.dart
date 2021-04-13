import 'package:auto_route/auto_route_annotations.dart';
import 'package:jobseeker/modules/home/home.dart';
import 'package:jobseeker/modules/jobboard/jobboard.dart';
import 'package:jobseeker/modules/login/login.dart';
import 'package:jobseeker/modules/reset/reset.dart';
import 'package:jobseeker/modules/verify/verify.dart';

/// Run 'flutter packages pub run build_runner watch --delete-conflicting-outputs'
/// to gerenate routing files.
@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute<LoginScreen>(page: LoginScreen, initial: true),
    MaterialRoute<HomeScreen>(page: HomeScreen, path: '/home'),
    MaterialRoute<JobBoardScreen>(page: JobBoardScreen, path: '/jobboard'),
    MaterialRoute<ResetScreen>(page: ResetScreen, path: '/reset'),
    MaterialRoute<VerifyScreen>(page: VerifyScreen, path: '/verify'),
  ],
)
class $Router {}
