import 'package:exspenses/core/navigation/routes.dart';
import 'package:exspenses/features/home/page/home_detail.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeDetail(),
    )
  ],
);
