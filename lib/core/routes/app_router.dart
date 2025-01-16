import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../ui/login/view/login_view.dart';
import '../../ui/profile/view/profile_view.dart';

final rooterNavigatorKey = GlobalKey<NavigatorState>();

enum RoutesPath {
  loginPath(path: '/', full: '/'),
  profilePath(path: '/profile', full: '/profile');

  const RoutesPath({required this.path, this.full});

  final String path;

  final String? full;
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesPath.loginPath.path,
    navigatorKey: rooterNavigatorKey,
    routes: <GoRoute>[
      /// Loogin Page
      GoRoute(
        path: RoutesPath.loginPath.path,
        name: RoutesPath.loginPath.name,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),

      /// Profile Page
      GoRoute(
          parentNavigatorKey: rooterNavigatorKey,
          path: RoutesPath.profilePath.path,
          name: RoutesPath.profilePath.name,
          builder: (BuildContext context, GoRouterState state) {
            final accessToken = state.extra! as String;
            return ProfileView(
              accessToken: accessToken,
            );
          })
    ],
  );
}
