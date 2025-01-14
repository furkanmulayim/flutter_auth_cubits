import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../ui/login/view/login_view.dart';
import '../../ui/profile/view/profile_view.dart';

class AppRouter {
  //params
  static String loginPath = '/';
  static String profilePath = '/prof';

  static final GoRouter router = GoRouter(
    initialLocation: loginPath,
    routes: <GoRoute>[
      /// Loogin Page
      GoRoute(
        path: loginPath,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),

      /// Profile Page
      GoRoute(
        path: profilePath,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfileView(),
      )
    ],
  );
}
