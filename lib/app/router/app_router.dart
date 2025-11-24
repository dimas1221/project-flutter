import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/page/home_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/map/map_page.dart';
import '../../features/schedule/schedule_page.dart';

import './navigation_shell.dart'; // pastikan path & nama file sesuai

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // navigationShell di sini bertipe StatefulNavigationShell — benar
          return AppNavigationShell(shell: navigationShell);
        },
        branches: [
          // HOME branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // MAP branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/map',
                name: 'map',
                builder: (context, state) => const MapPage(),
              ),
            ],
          ),

          // SCHEDULE branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/schedule',
                name: 'schedule',
                builder: (context, state) => const SchedulePage(),
              ),
            ],
          ),

          // PROFILE branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
