import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_checkin_app/pages/checkin_page.dart';
import 'package:student_checkin_app/pages/home_page.dart';
import 'package:student_checkin_app/pages/loading_page.dart';
import 'package:student_checkin_app/pages/login_page.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => LoadingPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return LoginPage();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) {
      return HomePage();
    },
  ),
  GoRoute(
    path: '/checkin',
    builder: (context, state) {
      return CheckInPage();
    },
  ),
]);
