// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRouteWidget.name: (routeData) {
      final args = routeData.argsAs<AuthRouteWidgetArgs>(
          orElse: () => const AuthRouteWidgetArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthPageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ProfileRouteWidget.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteWidgetArgs>(
          orElse: () => const ProfileRouteWidgetArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ProfileTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabPage(),
      );
    },
    RegistrationRouteWidget.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteWidgetArgs>(
          orElse: () => const RegistrationRouteWidgetArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegistrationPageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    WorksRouteWidget.name: (routeData) {
      final args = routeData.argsAs<WorksRouteWidgetArgs>(
          orElse: () => const WorksRouteWidgetArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorksPageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    WorksTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorksTabPage(),
      );
    },
  };
}

/// generated route for
/// [AuthPageWidget]
class AuthRouteWidget extends PageRouteInfo<AuthRouteWidgetArgs> {
  AuthRouteWidget({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultAuthPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRouteWidget.name,
          args: AuthRouteWidgetArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRouteWidget';

  static const PageInfo<AuthRouteWidgetArgs> page =
      PageInfo<AuthRouteWidgetArgs>(name);
}

class AuthRouteWidgetArgs {
  const AuthRouteWidgetArgs({
    this.key,
    this.wmFactory = defaultAuthPageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AuthRouteWidgetArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePageWidget]
class ProfileRouteWidget extends PageRouteInfo<ProfileRouteWidgetArgs> {
  ProfileRouteWidget({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultProfilePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRouteWidget.name,
          args: ProfileRouteWidgetArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRouteWidget';

  static const PageInfo<ProfileRouteWidgetArgs> page =
      PageInfo<ProfileRouteWidgetArgs>(name);
}

class ProfileRouteWidgetArgs {
  const ProfileRouteWidgetArgs({
    this.key,
    this.wmFactory = defaultProfilePageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ProfileRouteWidgetArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ProfileTabPage]
class ProfileTab extends PageRouteInfo<void> {
  const ProfileTab({List<PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationPageWidget]
class RegistrationRouteWidget
    extends PageRouteInfo<RegistrationRouteWidgetArgs> {
  RegistrationRouteWidget({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultRegistrationPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          RegistrationRouteWidget.name,
          args: RegistrationRouteWidgetArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationRouteWidget';

  static const PageInfo<RegistrationRouteWidgetArgs> page =
      PageInfo<RegistrationRouteWidgetArgs>(name);
}

class RegistrationRouteWidgetArgs {
  const RegistrationRouteWidgetArgs({
    this.key,
    this.wmFactory = defaultRegistrationPageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'RegistrationRouteWidgetArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [WorksPageWidget]
class WorksRouteWidget extends PageRouteInfo<WorksRouteWidgetArgs> {
  WorksRouteWidget({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultWorksPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          WorksRouteWidget.name,
          args: WorksRouteWidgetArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'WorksRouteWidget';

  static const PageInfo<WorksRouteWidgetArgs> page =
      PageInfo<WorksRouteWidgetArgs>(name);
}

class WorksRouteWidgetArgs {
  const WorksRouteWidgetArgs({
    this.key,
    this.wmFactory = defaultWorksPageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'WorksRouteWidgetArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [WorksTabPage]
class WorksTab extends PageRouteInfo<void> {
  const WorksTab({List<PageRouteInfo>? children})
      : super(
          WorksTab.name,
          initialChildren: children,
        );

  static const String name = 'WorksTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}
