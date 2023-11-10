import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/features.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) => RouterTransitionFactory.getTransitionPage(
          context: context,
          state: state,
          type: 'fade',
          child: const HomeScreen(),
        ),
      ),

    ],
  );
}

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required String type,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case 'fade':
            return FadeTransition(opacity: animation, child: child);
          case 'rotation':
            return RotationTransition(turns: animation, child: child);
          case 'size':
            return SizeTransition(sizeFactor: animation, child: child);
          case 'scale':
            return ScaleTransition(scale: animation, child: child);
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }
}
