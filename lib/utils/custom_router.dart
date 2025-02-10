import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingu_kang/home/home_detail_screen.dart';
import 'package:mingu_kang/home/home_screen.dart';
import 'package:mingu_kang/main.dart';

import '../contact/contact_detail_screen.dart';
import '../contact/contact_screen.dart';
import '../history/history_detail_screen.dart';
import '../history/history_screen.dart';

class CustomRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MyHomePage(child: child,);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'detail', // '/' 생략 가능
                builder: (context, state) => HomeDetailScreen(),
              ),
            ],
            pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => HistoryScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) => HistoryDetailScreen(),
              ),
            ],
            pageBuilder: (context, state) => NoTransitionPage(child: HistoryScreen()),
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) => ContactScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) => ContactDetailScreen(),
              ),
            ],
            pageBuilder: (context, state) => NoTransitionPage(child: ContactScreen()),
          ),
        ],
      ),
    ],
  );
}
