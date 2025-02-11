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
  // static GoRouter router = GoRouter(
  //   initialLocation: '/home',
  //   routes: <RouteBase>[
  //     GoRoute(
  //       path: '/',
  //       redirect: (context, state) => '/home',
  //     ),
  //     ShellRoute(
  //       builder: (context, state, child) {
  //         return MyHomePage(child: child,);
  //       },
  //       routes: [
  //         GoRoute(
  //           path: '/home',
  //           builder: (context, state) => HomeScreen(),
  //           routes: [
  //             GoRoute(
  //               path: 'detail', // '/' 생략 가능
  //               builder: (context, state) => HomeDetailScreen(),
  //             ),
  //           ],
  //           pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
  //         ),
  //         GoRoute(
  //           path: '/history',
  //           builder: (context, state) => HistoryScreen(),
  //           routes: [
  //             GoRoute(
  //               path: 'detail',
  //               builder: (context, state) => HistoryDetailScreen(),
  //             ),
  //           ],
  //           pageBuilder: (context, state) => NoTransitionPage(child: HistoryScreen()),
  //         ),
  //         GoRoute(
  //           path: '/contact',
  //           builder: (context, state) => ContactScreen(),
  //           routes: [
  //             GoRoute(
  //               path: 'detail',
  //               builder: (context, state) => ContactDetailScreen(),
  //             ),
  //           ],
  //           pageBuilder: (context, state) => NoTransitionPage(child: ContactScreen()),
  //         ),
  //       ],
  //     ),
  //   ],
  // );
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => MaterialPage(
          child: MyHomePage(
            child: const HomeScreen(),
          ),
        ),
        routes: [
          GoRoute(
            path: 'detail',
            pageBuilder: (context, state) => MaterialPage(
              child: const HomeDetailScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => MaterialPage(
          child: MyHomePage(
            child: const HistoryScreen(),
          ),
        ),
        routes: [
          GoRoute(
            path: 'detail',
            pageBuilder: (context, state) => MaterialPage(
              child: const HistoryDetailScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/contact',
        pageBuilder: (context, state) => MaterialPage(
          child: MyHomePage(
            child: const ContactScreen(),
          ),
        ),
        routes: [
          GoRoute(
            path: 'detail',
            pageBuilder: (context, state) => MaterialPage(
              child: const ContactDetailScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
