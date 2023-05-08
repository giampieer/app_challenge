import 'package:app_challenge/modules/elements/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
    ],
  );
}
