import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingu_kang/home/home_detail_screen.dart';
import 'package:mingu_kang/home/home_screen.dart';
import 'package:mingu_kang/main.dart';

import '../contact/contact_detail_screen.dart';
import '../contact/contact_screen.dart';
import '../project/project_detail_screen.dart';
import '../project/project_screen.dart';

class CustomRouter {
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
            child: const ProjectScreen(),
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
