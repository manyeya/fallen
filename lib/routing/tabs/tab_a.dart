import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');

var tabA = StatefulShellBranch(
  navigatorKey: _shellNavigatorAKey,
  routes: [
    // top route inside branch
    GoRoute(
      path: '/a',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Text('Tab A'),
      ),
      routes: const [
        // child routes
      ],
    ),
  ],
);
