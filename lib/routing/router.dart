import 'package:fallen/routing/tabs/tab_a.dart';
import 'package:fallen/routing/tabs/tab_b.dart';
import 'package:fallen/routing/widgets/scafold_nested.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            //tabs
            tabA,
            tabB
          ]),
      // GoRoute(
      //   path: '/',
      //   name: 'welcome',
      //   builder: (context, state) => const WelcomeScreen(),
      // )
    ],
  );
});
