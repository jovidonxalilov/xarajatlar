import 'package:exspenses/core/navigation/routes.dart';
import 'package:exspenses/features/auth/login/page/login_detail.dart';
import 'package:exspenses/features/auth/sign_up/page/sign_up_detail.dart';
import 'package:exspenses/features/splash/splash_detail.dart';
import 'package:go_router/go_router.dart';
import '../../features/image_picker.dart';
import '../../features/xarajatlar/page/home_detail.dart';

final router = GoRouter(
  initialLocation: Routes.image,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeDetail(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginDetail(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpDetail(),
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashDetail(),
    ),
    GoRoute(
      path: Routes.image,
      builder: (context, state) => ImagePickerPage(),
    ),
  ],
);
