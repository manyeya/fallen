import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

var tabB = StatefulShellBranch(
  navigatorKey: _shellNavigatorAKey,
  routes: [
    // top route inside branch
    GoRoute(
      path: '/B',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Text('Tab B'),
      ),
      routes: const [
        // child routes
      ],
    ),
  ],
);
