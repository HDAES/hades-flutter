import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hades/pages/detail.dart';
import 'package:hades/pages/index.dart';
import 'package:hades/pages/page1.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const IndexPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return const Detail();
          },
        )
      ],
    ),
    GoRoute(
      path: '/page1',
      builder: (BuildContext context, GoRouterState state) {
        return const Page1();
      },
    )
  ],
);
