import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/pages/auth_page/auth_page_widget.dart';
import 'package:sadovod/pages/auth_page/auth_page_wm.dart';
import 'package:sadovod/pages/home_page/home_page.dart';
import 'package:sadovod/pages/profile_page/profile_page_widget.dart';
import 'package:sadovod/pages/profile_page/profile_page_wm.dart';
import 'package:sadovod/pages/registration_page/registration_page_widget.dart';
import 'package:sadovod/pages/registration_page/registration_page_wm.dart';
import 'package:sadovod/pages/works_page/works_page_widget.dart';
import 'package:sadovod/pages/works_page/works_page_wm.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRouteWidget.page),
    AutoRoute(page: RegistrationRouteWidget.page),
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
      children: [
        AutoRoute(initial: true, page: ProfileTab.page, children: [
          AutoRoute(
            initial: true,
            page: ProfileRouteWidget.page,
          ),
        ]),
        AutoRoute(page: WorksTab.page, children: [
          AutoRoute(
            initial: true,
            page: WorksRouteWidget.page,
          ),
        ]),
      ],
    ),
  ];
}

@RoutePage(name: 'ProfileTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}

@RoutePage(name: 'WorksTab')
class WorksTabPage extends AutoRouter {
  const WorksTabPage({super.key});
}

